


# Resource Manager



## Bucket
- A bucket is a storage container or repository used to store and manage data or files.
- You can view and manage bucket that have been manually created ar applied for through services templates.


 ### Steps to create bucket
1. To create a new bucket ,click on the create button, enter the name of the bucket.
2. Select the type of the bucket, select the backend .
3. Then if needed, enable the encryption and select the type of encryption tpye (option).
4. Finally click on the OK button to create the bucket or if you want to cancle it ,click on cancel button.
 
  -  Name: has to unique.
  - Type: object or block or file or archive storage
  - Backend: The underlying infrastructure and technology used to store and manage all the data in the bucket.
   


## Volume 
- Volume is way to managing data within a containerized environment .
- On Premise: You can view and manage volume's that have been manually created or applied for through service templates .


###  Steps to create a volume
1. To create a new volume,  click on the create button.
2. Select the availability zone, enter the name of the volume, select the profile and select the capacity.
3. If needed enable "configuration replication" option and fill the details in the replication pair .
4. Finally click OK button to create the premise volume, or click on cancel button to cancle it.



-  Availability Zone : physical location within a data center or cloud infrastructure where a copy of volume's data is stored.
- Name : has to be descriptive and unique
-  Profile:  a set of configuration setting that define the characteristics and behaviour of the volume.
-  Capacity : The amount of storage space available  to store data.

## Cloud Volume
- You can view and manage cloud volume that have been manually created or applied for through service templates.
  
 ###  Steps to create a volume
1. To create a new volume, click on the create button.
2. Select the backend.
3. Enter the name, enter the description(optional), enter the  availability zone .
4. Select the volume type and enter the size .
5. Finally click OK button to create the premise cloud volume, or click on cancel button to cancle it.You can  click delete button to delete the created volume .
   

-  Backend type : Block or file or object or hybrid storage.
-  Backend: underlying storage system or infrastructure that provide actual storage capacity foe the volume.
-  Name : has to be descriptive and unique.
-  Availability Zone : physical location within a data center or cloud infrastructure where a copy of volume's data is stored.
-  Volume Type : A specific type of storage volume that can be created and attached to instance running in the cloud.
-  Size: Amount of storage capacity that is allocated to a specific volume.


## Volume Group:
- Volume group is a collection of physical storage device that are managed together as a single logical unit.
  
###  Steps to create a volume
1. To create a new volume group, click on the create button.
2. Enter the group name, enter the description(optional), enter the  availability zone and profile .
3. Finally click OK button to create the volume group , or click on cancel button to cancle it.You can  click delete button to delete the created volume group .


-  Group Name: has to be consistent and descriptive.
- Description (optional): What is this volume group for ?
- Availability Zone : A specfic set of service and storage device that are grouped together to  provide storage redundancy and availability.
-  Profile : a set of characteristics or specification that define the performance and behaviour of the volumes within the group.


## File Share
- File sharing is the distribution of files , such as documents ,images,or any other type of digital content,among the users.
-  On Premise: You can view and manage file share that have been manually created or applied for through service templates .

### Steps to create a file share
1. To create a new file share, click on the create button.
2. Select the availability zone, enter the name, Select the profile ,enter the description(optional) .
3. Finally click OK button to create the file share . on premise file share or click on cancel button to cancle it. You can also delete the created file share by clicking on the delete button. 


- Availability Zone : A specfic set of service and storage device that are grouped together to  provide storage redundancy and availability.
- Name : has to be descriptive and simple.
- Profile : a set of characteristics or specification that define the performance and behaviour of the shared files.
- Capacity : The amount of storage space available for sharing file and data.
- Description (optional): What is this file share for ?


## Cloud File Share
- You can view and manage cloud file share that have been manually created or applied for through service templates.
  
### Steps to create a cloud file share
1.  To create a new file share, click on the create button.
2.  Select the backend type and the backend,enter the name,enter the description(optional) .
3.  Finally click OK button to create the file share or click on cancle button to cancle it. You can also delete the created file share by clicking on the delete button. 
  
 
 - Backend Type: Public cloud storage or private cloud storage or hybrid cloud storage or object storage .
 - Backend: The underlying infrastructure and technology used to store and manage all the data  being shared on the network.
 - Name : has to be descriptive and simple.
-  Description (optional): What is this file share for ?
  

## Hosts
- Hosts are the platform or environment on which open service project are developed,distributed and maintained

### Steps to register as host
1. to register a new host ,click on the register button.
2. Enter the host name, select OS type, enter the IP Address, select the access mode and availability zone.
3. Then for initiator, enter the port and selct the protocal .You can also addmore ports and protocols by clicking on the '+' option given and it can br removed by clicking on the '-' option.
4. Finally you can click the OK button add a new host or click on the cancel button to cancel it. You can also delete the added host by clicking on the delete button. 


- Name: has to be unique and descriptive.
-  OS Type: linux or windows or ESX.
-  IP Address : assigned to each host to enable  network communication between the hosts.
-  Access mode : Agentless or not 
-  Availability Zone: a logical grouping of hosts within a data center or cloud environment.
-  Port: A  virtual communication end point that is used to enable communication between host over a network.
- Protocol: A set of rules and standarads that govern to communication betweeen host over a network.


# Data flow 
- The data flow in SODA typically involves the following steps:
    1. Data is ingested from various sources such as files, databases, or streams.
    2. The data is transformed and preprocessed using SODA's built-in data processing functions or custom user-defined functions.
    3. The processed data is stored in SODA's distributed object store, which allows for efficient and scalable storage and retrieval of large datasets.
    4. Data analytics applications are developed using SODA's APIs and libraries, which enable users to perform complex analytics tasks such as machine learning, graph processing, and real-time data processing.
    5. The results of data analytics tasks are stored in SODA's object store or exported to external systems for further analysis or visualization.

- Overall, SODA provides a flexible and scalable platform for managing and processing large datasets, enabling users to perform sophisticated data analytics tasks with ease.


# Migration
- Migration  refers to the process of transferring data and applications from one SODA environment to another, such as moving from a development environment to a production environment. 
- Migration in SODA typically involves the following steps:
    1. Exporting the data and applications from the source environment into a migration package, which is a compressed file that contains all the necessary files and metadata for the migration process.
    2. Transferring the migration package to the target environment, typically via a secure file transfer protocol such as SFTP.
    3. Importing the migration package into the target environment, which involves unpacking the files and metadata and setting up the necessary configurations and dependencies.
    4. Testing the migrated data and applications in the target 
       environment to ensure that they function correctly and meet the desired performance criteria.
- To create a migration plan click on the create button and fill the details:
    1. Plan name: The plan name in creating a migration plan refers to the name or label assigned to the migration plan for identification and tracking purposes. The plan name should be unique and descriptive, and should reflect the scope and objective of the migration project. 
    2.  Source bucket: a source bucket refers to the data storage container from which the data is being migrated in a migration plan. A bucket is a logical container used in SODA to store data objects, such as files, images, or documents. 





## Reource Monitor

### Storage Summary
  - The storage summary in a soda dashboard provides a high-level view of the storage resources being used by the system, as well as any potential issues that may need to be addressed. 
   - To register a storage summary, click on register button, select the vendor and model and click on OK button or click on cancel button to cancel it or click on reset button to reset it.

## Performance Monitor
- Performance monitor that allows users to track the performance of their data pipelines and data processing jobs.


### Average IOPS
  - The average throughput and IOPS in performance monitor or resource monitor in SODA Foundation can vary widely depending on the specific system, workload, and other factors.
  - The average IOPS in a storage system can vary widely depending on the specific system, workload, and other factors.
  The average response time in performance monitor or resource monitor in SODA Foundation is a measure of the time taken for a system to respond to a request or a task, and can vary depending on the specific system and workload.

### Average Throughput
  - The average throughput generally refers to the average rate of data transfer or processing over a specific period of time. This metric is often used to measure the performance and efficiency of a system, such as a database or data pipeline.

### Average Response 
   - The average response time in performance monitor or resource monitor in SODA Foundation is a measure of the time taken for a system to respond to a request or a task, and can vary depending on the specific system and workload.

## Alert Manager
-  Alert manager in Soda Dashboard is a way to manage and display alerts generated by Prometheus monitoring system in the Soda Dashboard platform.
-  Alert Manager is a powerful tool that enables you to monitor and manage alerts generated by Soda Dashboard.

### Alerts
 - Alerts are rules that you can create to monitor data and receive notifications when certain conditions are met. These alerts can be configured to monitor a wide range of data sources, including databases, streaming data, and logs.
 - Once you have created an alert, it will appear in the Alert Manager interface along with other alerts that you have created. From here, you can manage your alerts by editing or deleting them as needed.

 ### Silences
 - silence in Alertmanager is a mechanism for temporarily muting or suppressing alerts for a specific period of time.

 ### Status
 - The status in Alertmanager refers to the current state of an alert.
 - It provides details of cluster status an version information.

 #### Steps to Create New Silence 
 1. In the web interface, you can navigate to the "Silences" tab and click on the "New silence" button to create a new silence. 
 2. You can then specify the criteria for the silence, including the alert labels and the duration of the silence.









    3. Destination bucket: a destination bucket refers to the data storage container to which the data is being migrated in a migration plan. The destination bucket is where the migrated data will reside after the migration is complete. 

    4. Execution time: Execution time refers to the estimated or actual time required to complete a migration plan. It is the duration of time from the start of the migration process to the completion of the migration. The execution time can vary depending on the size and complexity of the data.




# Identity

## Tenant
- A tenant is used to group and manage resources and users .
### Steps to create anew tenant
1. To create a new tenant, click on create button.
2. Enter the name and the description(optional).
3. Then click OK button to createnew tenant or click on cancle button to cancel it. You can click the delete button to delete the created tenant.
   

- Name : NAme of the tenant.
- Description(optional): information about the specific feature and functionality that are available to the tenant .



## Users 
### Steps to create new wsers
1. To create a new user, click on create button.
2. Enter the username and description(optional).
3. Select the tenant ,enter the password and confirm the password .
4. Then click on OK button to add the new user or click on the cancel button to cancel  it. You can click on the delete button to delete the aded user.


 
- Username : Unique and consistent
- Description(optional): information about the specific feature and functionality that are availanle to the user.
- Tenant : used to group and manage resources and users.
- Password : use a strong password.



