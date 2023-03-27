# How to install and setup NodeJS and npm?
- **step 1:**
Open the Terminal on your Ubuntu system. You can do this by pressing the **"Ctrl+Alt+T"** keys simultaneously.
- **step 2:**
Update your package list by typing the following command in the Terminal:

   `sudo apt-get update`
 - **step3:**
  Install Nodejs using the following command: 
  
    `sudo apt get install node js`
  - **step4:**
   Check if Node.js is installed by typing the following command:
   
    `node -v`
    
    This will display the version number of Node.js installed on your system.
   - **step5:**
Install NPM (Node Package Manager) by typing the following command:

      `sudo apt-get install npm`
   - **step6:**
    Check if NPM is installed by typing the following command:

      `npm -v`
   - **step7:**
      If you encounter any issues with the installation, you can try updating the package list again by typing the following command:
      
        `sudo apt-get update`

       Then repeat steps 3-6.
## Steps to update the nodejs and npm versions

- **step 1:**
Open the Terminal on your Ubuntu system.
- **step 2:**
Check the currently installed versions of Node.js and NPM by typing the following commands:

   `node -v npm -v`
 - **step3:**
 To update Node.js, you can use the Node Version Manager (nvm) tool. If you do not have nvm installed, you can install it using the following command:
  

   curl -o- [https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh](https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh) | bash
  - **step4:**
 Once nvm is installed, you can use it to install the latest version of Node.js by typing the following command:
   
    `nvm install node`
    
    This will install the latest version of Node.js. You can verify the version by typing the following command:
    
    `node -v`
   - **step5:**
To update NPM to the latest version, you can use the following command:

     `npm install -g npm@latest`

     This will install the latest version of NPM globally. You can verify the version by typing the following command:
 
     `npm -v`

     If you want to update NPM for a specific project, you can navigate to the project directory and run the above command without the -g flag.
## How to manage multiple versions of node.js and npm using nvm
 
 - **Step1:**
       Install nvm on your Ubuntu system by running the following command in your terminal:
       
      ` curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash`
       
     This will download and install the latest stable version of nvm.
 - **Step2:**
Once nvm is installed, you can use it to install and manage different versions of Node.js by running the following command:

     `nvm install <node_version>`
     
    Replace **<node_version>** with the version of Node.js you want to install, such as "14.18.1". This will download and install the specified version of Node.js.

- **Step3:**
 use a specific version of Node.js, you can run the following command:
 
   `nvm use <node_version>`
      
  This will set the specified version of Node.js as the active version.

- **Step4:**
  You can also set a default version of Node.js by running the following command:

     `nvm alias default <node_version>`

    This will set the specified version of Node.js as the default version that will be used when you open a new terminal window.
    
- **Step5:**
    To check the currently installed versions of Node.js, you can run the following command:

      `nvm ls`
      
    This will show a list of all the installed versions of Node.js.
- **Step6:**
   To uninstall a specific version of Node.js, you can run the following command:

    `nvm uninstall <node_version>`

    Replace **<node_version>** with the version of Node.js you want to uninstall.

     With these steps, you can manage multiple versions of Node.js and npm on Ubuntu using nvm.
