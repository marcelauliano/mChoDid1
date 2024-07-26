# 1. Kayoploter plotting repeats from Earlgrey
## 1.1 General Satellite Repeats mChoDid1

Used [this script](https://github.com/marcelauliano/mChoDid1/blob/main/repeats/plot_repeats.R) to plot the Satellites. Note that line 15 indicates the order to plot the chromosomes. 
To change repeat type, edit lines 15 and 20.

![image](https://github.com/user-attachments/assets/a278907c-1605-42fc-85de-2fd04e931935)

## 1.2 Simple_repeat mChoDid1
![image](https://github.com/user-attachments/assets/54176eb1-a67d-40d7-9f84-f14d85c131e8)


## 1.3 LINE mChoDid1

```
kpPlotDensity(kp, data=allreps, window.size = 10e5, col="lightblue" )
```

![image](https://github.com/user-attachments/assets/20c8677c-aab2-418b-8721-0de93939e6a6)

### 1.3.1 LINE/L1 mChoDid1

```
allreps <- features[features$type=="LINE/L1"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col="blue" )
```

![image](https://github.com/user-attachments/assets/d801d328-6256-4bf7-9047-e8e4fe9cabc8)


### 1.3.2 LINE/L2 mChoDid1

```
allreps <- features[features$type=="LINE/L2"]
kpPlotDensity(kp, data=allreps, window.size = 10e4, col="green" )
```

![image](https://github.com/user-attachments/assets/817119a2-83b4-40a6-a297-d2c18031c876)

### 1.3.3 LINE/RTE-X mChoDid1

```
allreps <- features[features$type=="LINE/RTE-X"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col=5 )
```
![image](https://github.com/user-attachments/assets/7d66b966-9fd9-4f30-9ec8-9eb8259f5ca8)

### 1.3.4 LINE/L1-Tx1 mChoDid1

```
allreps <- features[features$type=="LINE/L1-Tx1"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col=4 )
```
![image](https://github.com/user-attachments/assets/3518702b-9e50-4ecb-a7ed-19fa1206208e)

### 1.3.5 LINE/CR1 mChoDid1
```
allreps <- features[features$type=="LINE/CR1"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col=4 )
```
![image](https://github.com/user-attachments/assets/b94d91f9-1b5d-4878-ab83-285ccfcd18a2)

### 1.3.6 LINE/R2 mChoDid1
```
allreps <- features[features$type=="LINE/R2"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col=1 )
```
![image](https://github.com/user-attachments/assets/49d5b2a7-9704-4a2e-a0bf-bf1370f24e20)

### 1.3.7 LINE/RTE-BovB mChoDid1
```
allreps <- features[features$type=="LINE/RTE-BovB"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col=2 )
```
![image](https://github.com/user-attachments/assets/ccc0d4e9-d7ca-451d-85fd-61b75d19cf31)

### 1.3.8 LINE/Dong-R4 mChoDid1

```
allreps <- features[features$type=="LINE/Dong-R4"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col=3 )
```
![image](https://github.com/user-attachments/assets/9063b6e5-10db-4418-97e1-4605da87b702)

### 1.3.9 LINE/I mChoDid1
```
allreps <- features[features$type=="LINE/I"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col=7 )
```
![image](https://github.com/user-attachments/assets/0197234d-6428-48d0-b54a-13126227b781)

### 1.3.10 LINE/I-Jockey mChoDid1
```
allreps <- features[features$type=="LINE/I-Jockey"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col=8 )
```
![image](https://github.com/user-attachments/assets/93e3860a-4106-4f5c-97dd-21e14770a61f)

### 1.3.11 LINE/Penelope mChoDid1
```
allreps <- features[features$type=="LINE/Penelope"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col=9 )
```
![image](https://github.com/user-attachments/assets/e3e37044-2130-465f-a6c1-e2a427a26c95)

### 1.3.12 LINE/R2-Hero mChoDid1
```
allreps <- features[features$type=="LINE/R2-Hero"]
kpPlotDensity(kp, data=allreps, window.size = 10e5, col=10 )
```
![image](https://github.com/user-attachments/assets/d42f05e6-09aa-4add-8702-09e3d36b276a)


## 2 Sloth-only LINES
Used [this script](https://github.com/marcelauliano/mChoDid1/blob/main/repeats/plot_specificRepeats.R)

![image](https://github.com/user-attachments/assets/d069d9a3-1a45-426a-87d9-756a3c5e64fc)

### 2.1 Sloth-only LINES
Same as 2, other plot type.
Used [this script](https://github.com/marcelauliano/mChoDid1/blob/main/repeats/plot_specificRepeats2.R)

![image](https://github.com/user-attachments/assets/397bb00b-a13c-46d2-9cb3-5591ac3a374b)

