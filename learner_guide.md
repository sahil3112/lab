# Cloud Native Security using ThreatMapper

## Lab Description: In this challenge, you have to scan the application hosted on self-managed Kubernetes in the Ubuntu VM to identify vulnerable third-party components, exposed secrets, malware, and security misconfigurations/bad security practices using ThreatMapper (an open-source Cloud-Native Application Protection Platform).

### Task Details

Globomantics is currently developing an application for their "ideal society," and they are very concerned about the repeated attacks from the Dark Kittens. Therefore, they want to ensure their application is secure. Your job is to identify vulnerable third-party open-source components used in the application, exposed secrets, the presence of any malware, and security misconfigurations/bad security practices. Lastly, you have to download the report from ThreatMapper for the application's developers so that they can fix the security issues to make the application more secure and implement proper security controls to protect the application from the Dark Kittens. Also, you have to configure all the scans to be scheduled so that developers can address the security issues as soon as they are reported.

**Task 1: Setup ThreatMapper Kubernetes connector**

You have access to the Application Server on which the application is hosted on the self-managed Kubernetes cluster. Therefore, your first task is to configure the ThreatMapper Kubernetes connector so that ThreatMapper can perform the scans and monitoring.

1. To access the ThreatMapper Management Console, use the URL: https://3.84.28.175/.
   _**Note:** Here, 3.84.28.175 is the public IP of the EC2 instance in which ThreatMapper is deployed._
   
2. In your browser, you will see a warning sign when you try to access the ThreatMapper Management Console, and it is due to the self-signed certificate. You can ignore this warning sign by simply clicking on the "Advanced" button and then "Accept the Risk and Continue."

   <img width="960" alt="Lab Wallpaper" src="https://github.com/sahil3112/lab/assets/43255158/54417dfa-47b3-4ac2-b36f-931d3c5ff2f0">
   
3. Once you bypass the security warning and access the ThreatMapper Management Console, you'll be presented with the login page. As the next step, you need to create an account in ThreatMapper by clicking on the "Register Now" button.

   <img width="289" alt="2024-02-13 00_59_12-Log in _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/8d97072a-4277-495d-993b-b7d360fa51d4">
   
4. On the registration page, fill in the basic details as shown in the provided image, then click the "REGISTER" button.

   <img width="196" alt="2024-02-13 01_00_11-" src="https://github.com/sahil3112/lab/assets/43255158/c9ac4e58-72e9-438e-9d46-2b22fe8c5881">
   
5. After registration, you will be redirected to the Connector Setup Page. On this page, in the host section, click on "Kubernetes" because our application is hosted on the Kubernetes Cluster in the Application Server.

   <img width="960" alt="2024-02-13 01_03_50-" src="https://github.com/sahil3112/lab/assets/43255158/f467dedd-a986-4093-93d0-1c99d84f62d0">
   
6. Now, you need to fill in the basic details about the Kubernetes Cluster to generate the command that you will run on the Application Server to set up the ThreatMapper Kubernetes connector.

    <img width="960" alt="2024-02-13 01_06_31-Connect Account _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/e9fffe2f-feb0-45e4-9363-73f3479935da">
    
7. To gather the information required for the ThreatMapper Kubernetes connection, you need to log in to the Application Server and execute the following commands as the root user:

   a. Command to get the cluster name:

   `kubectl config view --minify -o jsonpath='{.clusters[].name}'`

    <img width="744" alt="2024-02-13 01_11_06-" src="https://github.com/sahil3112/lab/assets/43255158/0c6e1cfe-2964-4179-a299-a61859fab3cd">

   b. Command to get the Namespaces (note that the Application Pods are running in the default namespace):

   `kubectl get namespaces`

    <img width="459" alt="2024-02-13 01_12_34-Lab Assignment - Google Docs" src="https://github.com/sahil3112/lab/assets/43255158/dc4c192c-8386-4108-9756-25243158cefb">


   c. Command to get the Socket Path:

   `k3s crictl info | jq -r '.config.containerdEndpoint'`

    <img width="677" alt="2024-02-13 01_16_16-Connect Account _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/1657acba-3497-4e8a-904f-664cd21e5a2d">

8. After entering all the necessary information in the ThreatMapper Kubernetes Connector setup, scroll down to the same page. You will find 3 commands listed for setting up the ThreatMapper Kubernetes Connector. Copy these commands one by one and execute them in the Application Server to set up the ThreatMapper Kubernetes Connector.

   <img width="886" alt="2024-02-13 01_17_37-Connect Account _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/50b18882-a54b-4e48-a4cb-5bb3d035d974">

   <img width="896" alt="2024-02-13 01_20_10-Connect Account _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/a97e3214-75b7-4604-8454-acee8f8861d4">

   <img width="926" alt="2024-02-13 01_21_58-Instance details _ EC2 _ us-east-1" src="https://github.com/sahil3112/lab/assets/43255158/a7abac84-1306-45ef-8d47-73e14bf33fc0">

   <img width="790" alt="2024-02-13 01_22_30-Instance details _ EC2 _ us-east-1" src="https://github.com/sahil3112/lab/assets/43255158/c7bd1336-5b0a-4d70-b931-fbe068f9dcb5">

   <img width="795" alt="2024-02-13 01_23_23-" src="https://github.com/sahil3112/lab/assets/43255158/089a1faf-ac33-406f-aa5c-263d9f9f833a">

9. To verify whether the ThreatAgent Kubernetes Connector is functioning correctly, run the following 3 commands:

  `kubectl get pods -n default`
  
  `kubectl describe daemonset -n default`
  
  `kubectl describe deployment -n default`

  These commands will provide information on the pods, daemonsets, and deployments in the default namespace, indicating if the ThreatAgent has been successfully deployed and is operational.

10. After executing all the commands, return to your browser and click on the "GO TO CONNECTOR" button. This action will navigate you to the section where you can review your connectors.

    <img width="960" alt="2024-02-13 01_26_02-" src="https://github.com/sahil3112/lab/assets/43255158/26f42809-0e36-4e13-92da-c47a9c06422b">

    <img width="899" alt="2024-02-13 01_27_23-" src="https://github.com/sahil3112/lab/assets/43255158/4a0d1d7e-34f0-4e60-bcd5-f13c3c507f9f">

    **Analysis:** In the "My Connector" section, you should see 2 Linux Hosts and 1 Kubernetes Cluster listed. Note that one Linux host corresponds to the Application Server, and the other belongs to the ThreatMapper Server. This view confirms that your connectors are correctly set up and the ThreatMapper is now integrated with your Kubernetes cluster and the respective servers. 
