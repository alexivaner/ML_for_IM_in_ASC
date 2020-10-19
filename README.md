# APC_for_IM_in_ASC
(Matlab code for Interference Management in Aerial Small Cells)

## System Architecture

![image](https://github.com/locoling/ML_for_IM_in_ASC/blob/main/Cell_scenarios.png)

* In our system, we assume that there are 12 Aerial Small Cells (ASCs) and 60 Users. 
* All Users' location data in file ue_loc_total_x_DSC_12.csv [time slots, the # of users(60)]
* Each ASC serves 5 Users [all the time]. We assume that 5 Users(it is seemed as 1 group) will always go toward the same direction. Also, that ASC will be in the center of each group.
* If there is any two ASCs getting closer to each other and hence cause servere interference. We will determine to close one of them. In other words, there will be only one ASC to serve these 10 Users(2 group). But the closed ASC is still in the center of the original group.

![image](https://github.com/locoling/ML_for_IM_in_ASC/blob/main/System_Architecture.png)

## Air-to-Ground Channel Model
* The 3D channel model of the 3rd Generation Partnership Project (3GPP) TR 38.901 [1] is used to simulate the link quality between aerial UAVs and ground users. (Channel_Model_3D.m)


## References
[1] 3GPP, “5G; study on channel model for frequencies from 0.5 to 100 GHz,” 3rd Gener. Partnership Project, Sophia Antipolis, France, Tech. Rep. TR 38.901 V14.1.1 Release 14, Aug. 2017. 
