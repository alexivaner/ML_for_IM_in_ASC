# ML_for_IM_in_ASC
(Matlab code for Interference Management in Aerial Small Cells)

## Our System Architecture

![image](https://github.com/locoling/ML_for_IM_in_ASC/blob/main/Cell_scenarios.png)

* In our system, we assume that there are 12 Aerial Small Cells (ASCs) and 60 Users.
* Each ASC serves 5 Users [all the time]. We assume that 5 Users(it is seemed as 1 group) will always go toward the same direction. Also, that ASC will be in the center of each group.
* If there is any two ASCs getting closer to each other and hence cause servere interference. We will determine to close one of them. In other words, there will be only one ASC to serve these 10 Users(2 group). But the closed ASC is still in the center of the original group.

![image](https://github.com/locoling/ML_for_IM_in_ASC/blob/main/System_Architecture.png)
