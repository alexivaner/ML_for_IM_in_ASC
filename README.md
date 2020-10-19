# APC_for_IM_in_ASC
(Matlab code for Interference Management in Aerial Small Cells)

## System Architecture

![image](https://github.com/locoling/ML_for_IM_in_ASC/blob/main/Cell_scenarios.png)

* In our system, we assume that there are 12 Aerial Small Cells (ASCs) and 60 Users. 
* All Users' location data in file ue_loc_total_x_DSC_12.csv [time slots, the # of users(60)]
* Each ASC serves 5 Users [all the time]. We assume that 5 Users(it is seemed as 1 group) will always go toward the same direction. Also, that ASC will be in the center of each group.
* If there is any two ASCs getting closer to each other and hence cause servere interference. We will determine to close one of them. In other words, there will be only one ASC to serve these 10 Users(2 group). But the closed ASC is still in the center of the original group.

## Start from the main.m
In the **main.m**, we compare four methods:

* All on: Each cell is operated by acitive mode.
* APC (Affinity Propagation Clustering): An algorithm usually used in the clusteing problem.

## Air-to-Ground Channel Model
**Channel_Model_3D.m**
* The 3D channel model of the 3rd Generation Partnership Project (3GPP) TR 38.901 [1] is used to simulate the link quality between aerial UAVs and ground users. 
* We use the urban micro (UMi) environment path loss model.
* We can obtain the air-to-ground (ATG) channel model between ASC 𝑛 and user 𝑘 and it is denoted as <img src="http://chart.googleapis.com/chart?cht=tx&chl={P{{L}_{n,k}}\text{[dB]}}" style="border:none;">

## Reference Signal Receiving Power (RSRP)
**RSRP_3D_UAV_UE.m**
* Following the ATG channel model, the channel power gain from ASC 𝑛 to mobile user 𝑘 can be expressed as <img src="http://chart.googleapis.com/chart?cht=tx&chl={{H}_{n,k}}={{({10}^{P{{L}_{n,k}}\text{[dB]}/10})}^{-1}}" style="border:none;">
* The RSRP of user 𝑘 from ASC 𝑛 over transmit power 𝑃𝑛 is calculated as  <img src="http://chart.googleapis.com/chart?cht=tx&chl={{{RSRP}_{n,k}}={{P}_{n}}\cdot{{H}_{n,k}}}" style="border:none;">

**Rx_signal_interference.m**
* The Rx of served user 𝑘 from ASC 𝑛: <img src="http://chart.googleapis.com/chart?cht=tx&chl={{RSRP}_{n,k,signal}}" style="border:none;">.
* The Rx of non-served user *q* from ASC 𝑛: <img src="http://chart.googleapis.com/chart?cht=tx&chl={{RSRP}_{q,k,interference}}" style="border:none;">.

## Performance Metrics from 
**All_Capacity.m**
* The downlink received signal-to-interference-plus-noise ratio (SINR) for wireless communications between ASC $n$ and user $k$ over transmit power $P_{n}$ is calculated as <img src="http://chart.googleapis.com/chart?cht=tx&chl={{\Gamma }_{n,k}}=\frac{{{P}_{n}}\cdot {{H}_{n,k}}}{{{B}_{n,k}}{{N}_{0}}+\sum\nolimits_{l{\ne} n}{{{P}_{l}}\cdot {{H}_{l,k}}}}\quad" style="border:none;">
* The total system throughput 𝑅𝑐𝑎𝑝𝑎𝑐𝑖𝑡𝑦 for 𝑁 ASCs can be obtained <img src="http://chart.googleapis.com/chart?cht=tx&chl={{R}_{capacity}}=\sum\nolimits_{n=1}^{N}{\sum\nolimits_{k=1}^{{{U}_{n}}}{{B}_{n,k}lo{{g}_{2}}(1 {+} {{\Gamma }_{n,k}})}}" style="border:none;">.

## References
[1] 3GPP, “5G; study on channel model for frequencies from 0.5 to 100 GHz,” 3rd Gener. Partnership Project, Sophia Antipolis, France, Tech. Rep. TR 38.901 V14.1.1 Release 14, Aug. 2017. 
