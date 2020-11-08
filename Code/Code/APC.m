% programs for adaptive Affinity Propagation clustering; an improvement
% of Affinity Propagation clusteirng (see Frey & Dueck, Science, Feb. 2007)
% Code by WANG Kaijun: wangkjun@yahoo.com and modified by Ivan Surya Hutomo - NCTU - 0860812.

function cluster_center= APC(ue_num, apc_num, Rx_signal_All, Rx_interfer_All)


k=find(Rx_signal_All);
sz=[ue_num,apc_num];
[row,col]=ind2sub(sz,k);


% Create Simmiliarity Matrices
simmatrix = zeros(apc_num,apc_num);
for column_ = 1:apc_num
    for row_ = 1:apc_num
        indices_nonnull=row(col==row_);
        summary=0;
        for indices = 1:length(indices_nonnull)
            summary=summary+(Rx_interfer_All(indices_nonnull(indices),column_)*10^18);
        end
        simmatrix(row_,column_)=summary;
    end
end

% Create Diagonal Simmiliarity Matrices
list_zero=find(simmatrix==0);

minimum=min(simmatrix(simmatrix>0));
for i = 1:length(list_zero)
    simmatrix(list_zero(i))=minimum;
end


writematrix(simmatrix,'simmiliarity.txt','Delimiter','tab')

nrun = 5000;   % max iteration times, default 50000
nrun2 = 5000;   % max iteration times for original AP
nconv = 100;     % convergence condition, default 50
pstep = 0.01;   % decreasing step of preferences: pstep*pmedian, default 0.01
lam = 0.5;      % damping factor, default 0.5
cut = 3;        % after clustering, drop an cluster with number of samples < cut

sw='simmiliarity.txt';


% initialization
type = 1;       % 1: Euclidean distances
simatrix = 1;   % 0: data as input; 1: similarity matrix as input

p = [];
Ms = load(sw);

M = Ms;
Ms = [];
data = [];

disp(' '); disp(['==> Clustering is running on ' sw ', please wait ...']);


tic;
if ~simatrix
   M = simatrix_make(data,type,nrow);
end
if ~length(p)
    dn = find(M(:,3)>-realmax);
    p = median(M(dn,3));         % Set preference to similarity median
end
[labels,netsim,iend,unconverged,dpsim,expref,exemplars,criterion] = apcluster(M,p,'convits',...
    nconv,'maxits',nrun2,'dampfact',lam);
trun = toc;
fprintf('\n## Running time = %g seconds \n', trun);
fprintf('## Running iterations = %g \n', iend);



% Get which DSC produce highest interference using Rx_Signal_All based on
% exemplar result from RX_Interference_All
droneOff_list=[];

% Find indices of non-zero minimum criterion 
[a,position]=min(criterion(criterion > 0));

disp("List of exemplars of DSC: ");
disp(exemplars);

disp("DSC with the lowest interference and does not need to be turn off: ");
disp(exemplars(position));

disp("DSC need to be turn off: ");
cluster_center=exemplars;
cluster_center(position)=[];



end