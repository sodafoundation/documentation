# How to install and setup NodeJS and npm?

## Steps to Install nodejs and npm

- **Step1:** Open the Terminal on your Ubuntu system. You can do this by pressing the `"Ctrl+Alt+T"`keys simultaneously.

   ![image](https://user-images.githubusercontent.com/123230184/229181011-0af4ed65-601c-4c34-8e4e-d6a799b002db.png)


- **Step2:**  Update your package list by typing the following command in the Terminal:

 ` sudo apt-get update`

   ![image](https://user-images.githubusercontent.com/123230184/229181292-71894ba1-e376-4f67-a655-d31639fc1fbc.png)


 - **Step3:** Install Node.js  using the following command:

 ` sudo apt-get install nodejs`
 
   ![image](https://user-images.githubusercontent.com/123230184/229181443-eb49b39d-6c88-4fd6-84ce-3c67fb210c39.png)


 - **Step4:** Check if Node.js is installed by typing the following command:
 
 `node -v`
 
   ![image](https://user-images.githubusercontent.com/123230184/229181792-afaa932b-630c-4b22-aaae-2267321cd568.png)

 
 This will display the version number of Node.js installed on your system.

- **Step5:** Check if NPM is installed by typing the following command:
 
 `npm -v`
 
   ![image](https://user-images.githubusercontent.com/123230184/229181871-7672e5ba-d3a6-47d7-a138-0530b498bcc0.png)

 
  This will display the version number of NPM installed on your system.



## Steps to update the nodejs and npm versions

 If you don't want to use NodeSource or nvm to update Node.js and npm on Ubuntu, you can try the following steps:

- **Step1:** Remove the existing versions of Node.js and npm:

`sudo apt remove nodejs npm `

  ![image](https://user-images.githubusercontent.com/123230184/229185161-3a0cadd1-5c46-4c54-9fa1-d34cc3b54b7d.png)

 
- **Step2:** Download the latest version of Node.js from the official website:

`curl -o node-v16.14.0-linux-x64.tar.xz https://nodejs.org/dist/v16.14.0/node-v16.14.0-linux-x64.tar.xz `

  ![image](https://user-images.githubusercontent.com/123230184/229185236-7be4e0ed-8a01-4bb6-a942-2dd5b901efce.png)

Replace v16.14.0 with the version of Node.js you want to install.

- **Step3:** Extract the downloaded tarball to the /opt directory:

`sudo mkdir -p /opt/nodejs `
`sudo tar -xJvf node-v16.14.0-linux-x64.tar.xz -C /opt/nodejs/ `

  ![image](https://user-images.githubusercontent.com/123230184/229186282-c46b7e3a-dca3-402b-a1fd-ac94c0a4ac29.png)


  ![image](https://user-images.githubusercontent.com/123230184/229185356-e61fe693-79ff-4cf6-bd2b-aa9833a06a29.png)


- **Step4:** Create a symlink to the Node.js executable in /usr/local/bin:

`sudo ln -s /opt/nodejs/node-v16.14.0-linux-x64/bin/node /usr/local/bin/node`
` sudo ln -s /opt/nodejs/node-v16.14.0-linux-x64/bin/npm /usr/local/bin/npm `

  ![image](https://user-images.githubusercontent.com/123230184/229185411-7509cb9c-f860-4778-ac1a-d2e61e1ed77e.png)

- **step5:** Verify the installed versions of Node.js and npm:

`node -v`
` npm -v `



  ![image](https://user-images.githubusercontent.com/123230184/229184107-8e7af3d5-6c86-4b21-9ef3-b778ffb63216.png)
  ![image](https://user-images.githubusercontent.com/123230184/229185502-ebd90c78-c77d-443c-ab5d-660f05e6ed1a.png)


This should install the latest version of Node.js and npm on your Ubuntu system without using NodeSource or nvm.



## How to manage multiple versions of node.js and npm using nvm

- **Step1:** Open the Terminal on your Ubuntu system.

- **Step2:** Install the latest version of CURL (if not already installed) by running the following command:

   `sudo apt install curl`
   
   ![image](https://user-images.githubusercontent.com/123230184/229029849-3dcfe7c5-5f0e-4686-a62b-7aeab3fc702a.png)



- **Step3**:To install NVM, run the following command in your terminal:

  ` curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash`
  
  ![image](https://user-images.githubusercontent.com/123230184/229029938-4650f5e3-5830-4c7c-8815-b51ea473942e.png)


- **Step4:** Close and reopen your terminal or run the following command to load the new **PATH**:

   `source ~/.bashrc`
   

   ![image](https://user-images.githubusercontent.com/123230184/229026933-8ec21844-30e3-4d05-b75a-827e75861a92.png)


- **Step5:** You can now verify the installation by running the following command:

   `nvm --version`
   
    ![image](https://user-images.githubusercontent.com/123230184/229030260-00137cae-f79b-47ae-8cb9-40dbdbebd641.png)



  Now that you have installed NVM, you can use it to manage multiple versions of Node.js and NPM.

- **Step6:** To install the latest stable version of Node.js, run:

  `nvm install node`
  
  ![image](https://user-images.githubusercontent.com/123230184/229030457-e3696f15-2576-4ce3-8959-00e64a791010.png)



 - **Step7:** Once nvm is installed, you can use it to install and manage different versions of Node.js by running the following command:

   `nvm install <node_version>`
   
   ![image](https://user-images.githubusercontent.com/123230184/229030514-ec921b38-fe67-4e5a-b6b9-bb96ea32a6dd.png)



   Replace **<node_version>** with the version of Node.js you want to install, such as **"14.18.1"**. This will download and install the specified version of Node.js.
   
  -  **Step8:** To check the currently installed versions of Node.js, you can run the following command:

     `nvm list`
     
     ![image](https://user-images.githubusercontent.com/123230184/229030613-d6c6fcf4-2f26-4971-a2e4-fff02660f8cf.png)



     This will show a list of all the installed versions of Node.js.

- **Step9:** To switch to a specific version of Node.js, run:

  `nvm use <version>`
  
  ![image](https://user-images.githubusercontent.com/123230184/229030661-6b80c38d-514f-45bd-893c-6d4051cdad83.png)


- **Step10:** To set a default version of Node.js to be used whenever a new terminal is opened, run:

  `nvm alias default <version>`
  
  ![image](https://user-images.githubusercontent.com/123230184/229030695-3b401590-0f2e-4c2d-945b-b8acee5a9658.png)


 - **Step11:** To uninstall a specific version of Node.js, you can run the following command:

   `nvm uninstall <node_version>`
   
   ![image](https://user-images.githubusercontent.com/123230184/229030723-f25ba3af-395e-4275-92b7-c8ce9086aee2.png)

 
   Replace **<node_version>** with the version of Node.js you want to uninstall.

   With these steps, you can manage multiple versions of Node.js and npm on Ubuntu using nvm.
   
  - **Step12:** To update NPM to the latest version, you can use the following command:
   
   `sudo npm install -g npm@<version>`
  
   ![image](https://user-images.githubusercontent.com/123230184/229187776-f7bfc2bd-8c63-4f19-826f-949f28018306.png)

 
   This will install the latest version of NPM globally. You can verify the version by typing the following command:
  
   `npm -v`
  
   ![image](https://user-images.githubusercontent.com/123230184/229187824-147fd070-652d-48a6-919d-88bfd0079590.png)

 
   If you want to update NPM for a specific project, you can navigate to the project directory and run the above command without the -g flag.

