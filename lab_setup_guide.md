# Lab Setup Guide

## VM Requirements

**1. Application Server**

  Server Name: Application Server
  
  Image: Ubuntu Server 22.04 LTS (HVM) (64-bit (x86))
  

**2. ThreatMapper Server**

  Server Name: ThreatMapper Server
  
  Image: Ubuntu Server 22.04 LTS (HVM) (64-bit (x86))



## Network Diagram

<img width="480" alt="image" src="https://github.com/sahil3112/lab/assets/43255158/87521be7-e9ad-4749-8bd0-333164441883">

## AWS EC2 Security Groups

To set up this lab certain ports need to be open in the Application Server and the ThreatMapper Server

**1. Ports that need to be open in ThreatMapper Server**

   **In-Bound Rules**

  <img width="708" alt="image" src="https://github.com/sahil3112/lab/assets/43255158/7adc4765-0b5a-42eb-8a87-d9c5a0be5a2a">


   **Out-Bound Rules**

   <img width="709" alt="image" src="https://github.com/sahil3112/lab/assets/43255158/e41a4b6a-4661-438d-916a-c7c325f469f6">

**2. Ports that need to be open in the Application Server**

**In-Bound Rules**

<img width="430" alt="image" src="https://github.com/sahil3112/lab/assets/43255158/4d58c600-84aa-44be-9e2e-9050fdc35b07">

**Out-Bound Rules**

<img width="377" alt="image" src="https://github.com/sahil3112/lab/assets/43255158/148768eb-bc0a-4c06-930b-41bb0dbe2981">


## Scripts for Setup the lab

**1. Application Server**

[application_server_setup.sh](https://github.com/sahil3112/lab/blob/main/application_server_setup.sh)

**2. ThreatMapper Server**

[ThreatMapper_server_setup.sh](https://github.com/sahil3112/lab/blob/main/ThreatMapper_server_setup.sh)


_**Note:** Run both scripts a root user_
