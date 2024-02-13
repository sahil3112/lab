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


**Task 2: Scan the Application and Kubernetes cluster**

1. On the "My Connector" page, click on the "Go to main dashboard" button. This action will take you to the main dashboard of the ThreatMapper Management Console.

   <img width="957" alt="2024-02-13 01_31_44-" src="https://github.com/sahil3112/lab/assets/43255158/74530c9f-2b5c-438c-83dc-dbced23b1999">

2. Next, click on the "Topology" button located on the sidebar. Then, click on the "Hosts" button and select the Application Server host. Finally, click on "view details" to get the more details about the specific host.

   <img width="958" alt="2024-02-13 01_36_35-" src="https://github.com/sahil3112/lab/assets/43255158/e15bc707-78ff-4088-8ede-ee54cecde482">

   <img width="539" alt="2024-02-13 01_37_48-" src="https://github.com/sahil3112/lab/assets/43255158/69278fce-1f55-4367-8e33-55247cf3b725">

3. The next step involves running various types of scans on the Application to assess its security. Here are the scans you need to execute:

    **a. Vulnerability Scan:** This scan will identify known vulnerable third party open source components used in the application, helping Globomantics developers to understand where they might be exposed to cyber threats by the Dark Kittens.

    **b. Secret Scan:** This type of scan looks for exposed secrets, such as passwords, tokens, and API keys, which could potentially be exploited by Dark Kittens.

   **c. Malware Scan:** A malware scan will search for any malicious software that might be present on the Application Server, indicating a breach by Dark Kittens.

   **d. Posture Scan:** Finally, a posture scan (often referred to as a configuration or compliance scan) assesses the server against security best practices and compliance standards, identifying misconfigurations or poor security practices that could lead to vulnerabilities.

4. First, let's initiate the Vulnerability Scan:

   a. Click on the "Action" button, then select "Start Vulnerability Scan."
   
   b. In the "New Vulnerability Scan" block, select all the packages. Ensure to check the options for "Golang binary," "Rust Binary," and "Priority Scan."

   c. Click the "START SCAN" button to begin the scan.

   <img width="538" alt="2024-02-13 01_41_50-Cloud Topology _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/3882289d-ac4b-4f01-a4e5-579aeddcd7ee">
   <img width="466" alt="2024-02-13 01_42_29-" src="https://github.com/sahil3112/lab/assets/43255158/18b752c7-b68a-4a03-b09e-924bac1496b3">

5. Next, proceed with the Secret Scan:

   a. Again, click on the "Action" button, then choose "Start Secret Scan."

   b. In the "New Secret Scan" block, mark the "Priority Scan" option.

   c. Click the "START SCAN" button to initiate the scan.

   <img width="541" alt="2024-02-13 01_46_00-Cloud Topology _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/1d3cce2b-0cce-4ecd-8f81-92b6d12da85b">
   <img width="181" alt="2024-02-13 01_46_33-Cloud Topology _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/1b397b5f-6acc-46e3-9e18-95172a851176">

6. Now, Malware Scan:

   a. Click on the "Action" button once more, then select "Start Malware Scan."

   b. In the "New Malware Scan" block, ensure the "Priority Scan" is checked.

   c. Click the "START SCAN" button to start the malware detection process.

   <img width="541" alt="2024-02-13 01_48_08-Cloud Topology _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/0489b302-4080-4f87-a251-7675fc6a433a">
   <img width="206" alt="2024-02-13 01_48_42-Cloud Topology _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/70d97610-bc49-4a01-8b52-5eda263b60af">

7. Lastly, conduct the Posture Scan:

   a. Click on the "Action" button and select "Start Posture Scan."
   
   b. In the "New Posture Scan" block, enable checks for "HIPAA," "GDPR," "PCI," and "NIST" compliance standards.

   c. Click the "START SCAN" button to commence the scan.

   <img width="480" alt="2024-02-13 01_50_50-Cloud Topology _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/3e1ea8ec-8525-4732-8994-6e1f0b22240f">
   <img width="479" alt="2024-02-13 01_51_03-Cloud Topology _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/7d203f28-ab86-47da-9b86-393b597839a3">
   <img width="482" alt="2024-02-13 01_51_16-Cloud Topology _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/4cb0a62f-e5da-4036-b2e3-51d726f5f951">
   <img width="480" alt="2024-02-13 01_51_35-Cloud Topology _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/a34c52f8-b3b4-4972-b87c-8aa089836d48">

Now that all scans have been triggered, to check the status, navigate to the "view details" block of the Application Server host and click on the "SECURITY SCAN" section. Note that scanning takes some time to complete, so please be patient while the system processes each scan thoroughly.

<img width="540" alt="2024-02-13 01_58_55-Cloud Topology _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/ce289119-7c7b-4743-baa4-a6e0658e58a8">


**Task 3: Scan Reporting**

Now that all types of scans are completed, the last task is to review the scan results and generate the report of each scan to share with the Development team to address the issues identified.

1. Analyse and Download the Vulnerability Scan Report:

   a. In the Application Server's "view details" block, click on the "SECURITY SCAN" button, then select "Vulnerability Scan."

   b. A new tab will open, displaying all the vulnerabilities reported by ThreatMapper. You can download the report by clicking on the "DOWNLOAD" button. Additionally, there is a "VIEW/DOWNLOAD SBOM" button to download the SBOM in various formats, such as CycloneDX, SPDX, and Syft.

   <img width="540" alt="2024-02-13 01_55_23-Cloud Topology _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/7e002b04-baf2-4f79-a597-b842a204a396">
   <img width="784" alt="2024-02-13 02_01_08-Vulnerability Scan Results _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/7deae1e7-ee38-493b-ae03-ec5bd4cdfdb3">
   <img width="600" alt="2024-02-13 02_03_21-" src="https://github.com/sahil3112/lab/assets/43255158/61a2157e-e0db-461e-b645-796d50cac3ac">

   **Analysis:** The Vulnerability Scan report reveals a detailed inventory of all security vulnerabilities detected in the application by open-source third-party components. It includes critical, high, medium, and low-severity vulnerabilities, providing insights into potential attack vectors that could be exploited by the Dark Kittens. The report also categorizes vulnerabilities based on the Common Vulnerabilities and Exposures (CVE) identifiers, offering a clear view of the risk level associated with each finding. The inclusion of a Software Bill of Materials (SBOM) further enhances understanding by listing all components used, making it easier to track and update vulnerable packages.

2. Analyse and Download the Secret Scan Report:

   a. Within the Application Server's "view details" block, click on the "SECURITY SCAN" button, then choose "Secret Scan."
    
   b. A new tab will appear, showing all the secrets detected by ThreatMapper. Download the report by clicking on the "DOWNLOAD" button.

   <img width="779" alt="2024-02-13 02_04_06-Secret Scan Results _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/ce0df0a9-7f3c-427f-ae24-e18775b96d70">
   
   **Analysis:** The Secret Scan report uncovers exposed secrets such as hardcoded passwords, API keys, and tokens within the application codebase. These findings are particularly alarming as they represent direct pathways for unauthorized access by the Dark Kittens into the application backend and associated services. The report typically lists the type of secret found, its location within the code, and a severity rating based on the potential impact of exposure.

3. Analyse and Download the Malware Scan Report:
  
   a. In the Application Server's "view details" block, click on the "SECURITY SCAN" button and then select "Malware Scan."

   b. A new tab will open, listing all the malware signatures identified by ThreatMapper. The report can be downloaded by clicking on the "DOWNLOAD" button.

   <img width="783" alt="2024-02-13 02_06_38-Malware Scan Results _ Deepfence — Mozilla Firefox" src="https://github.com/sahil3112/lab/assets/43255158/13bda0ba-f32b-4c14-9a3b-0a7b981cf33b">

   **Analysis:** The Malware Scan report identifies malicious software and scripts that may be injected by Dark Kittens to infiltrate the application server.
    
4. Analyse and Download the Posture Scan Report:

   a. To download the Posture Scan report, in the Application Server's "view details" block, click on the "SECURITY SCAN" button and then select "Posture Scan."

   b. A new tab will open, presenting all the compliance reports that have passed or failed. Download the report by clicking on the "DOWNLOAD" button.

   <img width="779" alt="2024-02-13 02_08_13-" src="https://github.com/sahil3112/lab/assets/43255158/06ffe85f-8572-420e-b74e-61112169f8da">

   **Analysis:** The Posture Scan (or Compliance Scan) report assesses the application server's configuration and security practices against established standards such as HIPAA, GDPR, PCI-DSS, and NIST frameworks. This report highlights compliance gaps, misconfigurations, and poor security practices that could lead to vulnerabilities and can be used by Dark Kittens to perform the attacks.

   Other than the Reports, the Security and development team of Globomantics can take advantage of the Topology and Threat Graph to get more visibility on the Application Cluster and Threat Surface

   <img width="960" alt="2024-02-13 02_11_57-" src="https://github.com/sahil3112/lab/assets/43255158/ce3e2e76-236c-4b51-a969-78d819ba7d86">

   <img width="959" alt="2024-02-13 02_12_22-" src="https://github.com/sahil3112/lab/assets/43255158/6cc827d7-c320-45a1-98c3-37f896a9c808">
