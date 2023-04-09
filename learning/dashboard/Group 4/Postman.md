# **Postman:** 101

<br>

![Javatpoint](https://static.javatpoint.com/tutorial/postman/images/postman-tutorial.png)

<br>

Postman is one of the most popular software testing tools which is used for API testing. With the help of this tool, developers can easily create, test, share, and document APIs. Here are some of the reasons why Postman is used by over 8 million users today: 

- Accessibility: One can use it anywhere after installing Postman into the device by simply logging in to the account.
- Using Collections: Postman allows users to build collections for their API-calls. Every set can create multiple requests and subfolders. It will help to organize the test suites.
- Test development: To test checkpoints, verification of successful HTTP response status shall be added to every API-call.
- Automation Testing: Tests can be performed in several repetitions or iterations by using the Collection Runner or Newman, which saves time for repeated tests.
- Creating Environments: The design of multiple environments results in less replication of tests as one can use the same collection but for a different setting.
- Debugging: To effectively debug the tests, the postman console helps to track what data is being retrieved.
- Collaboration: You can import or export collections and environments to enhance the sharing of files. You may also use a direct connection to share the collections.
- Continuous integration: It can support continuous integration.
- Application development: Accelerated application development with Postman eliminates dependencies and reduces the time taken by production by having the frontend and backend teams work in parallel.

This tutorial is created for those who would like to learn the basics of Postman. As the number of web and mobile applications is increasing, the importance of API testing is also growing. So this tutorial will help you to learn postman testing for testing APIs.

After completion of this tutorial, you will get a basic level of understanding of Postman and API testing. This tutorial will also give you a good understanding of how to use Postman to execute APIs for any given URL for your daily work.
<br>
<br>

## Installation, Setup and Updates

<br>

 Postman can be downloaded for all major operating systems, including Mac, Linux, and Windows, as a native app (standalone application). Postman is also available as a chrome extension application, but it is preferable to install and use the native desktop app because the extension does not support all the features that the native app has.
 <br>
 <br>

### Downloading and installing the native Postman application on Windows

<br>

* Go to this link (https://www.postman.com/downloads/) and click *Download* for Windows.<br><br>
![Javatpoint]( https://static.javatpoint.com/tutorial/postman/images/postman-installation-and-updates.png)<br>
 *For downloading the app for Windows, click on the download button and select the particular version. If you are using a 32-bit OS, you can choose the 32 bit option instead.*

* You can check the download progress on the bottom left if you are using the Chrome browser. Once the .exe file is downloaded, you need to install the application, as shown in the below image.<br><br>
![Javatpoint](https://static.javatpoint.com/tutorial/postman/images/postman-installation-and-updates2.png)<br>
*It is preferable to create an account as this will help you to save the work you do within Postman, and with this, you won't lose any work.*
<br>
<br>

### Downloading and installing the native Postman application on Linux (Ubuntu)

<br>

To install the latest version of the Postman desktop application, you can do so through the Snap Store using the following commands via the terminal.
```
$ sudo apt update
$ sudo apt install snapd
$ sudo snap install postman
```
Alternatively, you can download and install it within the Snap Store's UI.

<br>

![](https://i.imgur.com/N6Svo2y.png)<br><br>
Either way, this is the simplest method to install Postman on Linux/Ubuntu systems.

<br>

### Setting up Postman for proper usage on Linux and Windows

*While these screenshots were taken in Windows, the process henceforth will be the same in a Linux environment.*

<br>

* Create your account with all the required details, or sign up with Google, as shown in the image.<br><br>
![Javatpoint](https://i.imgur.com/UU6cI7m.png)

* After signing in, select the workspace tools as per your requirement, and then click on, continue to get the startup screen.<br><br>
![Javatpoint](https://static.javatpoint.com/tutorial/postman/images/postman-installation-and-updates5.png)

* You will see the following page, and then you are ready to use Postman.<br><br>
![Javatpoint](https://static.javatpoint.com/tutorial/postman/images/postman-installation-and-updates6.png)
<br>
<br>

### Steps to update the Postman desktop client

<br>

* You will receive a notification in your Postman app if any update is available.

* To download or install the latest update, click on the *Settings* icon, as shown in the image below, then go to *Update*.<br><br>
![Javatpoint](https://static.javatpoint.com/tutorial/postman/images/postman-installation-and-updates7.png)

* You can change the update settings by enabling the *Automatically download major updates* setting, as shown in the image below<br><br>
![Javatpoint](https://static.javatpoint.com/tutorial/postman/images/postman-installation-and-updates8.png)

* You can also check for the latest updates by clicking on *Check for updates*, which will show you if any new update is available.

* You will have to select the update option to download and install the latest update. When the download is complete, you will see a notification asking you to restart the app to install the updated features.

* It automatically downloads minor updates and bug fixes.

<br>

*Note that if you install Postman in a Linux environment you may not have the* Check for updates *option. This is because the updates are handled by the snap store, which automatically updates Postman on a regular basis.*

<br>

## Usage

The following steps will show you how to use Postman after properly installing and setting it up.

1. Open your Postman desktop application<br><br>
![](https://i.imgur.com/LRI7l6I.png) 

2. Open Postman and select *Workspaces*<br><br>
![](https://i.imgur.com/JFzKUuq.png)

3. In the workspace section section, click on *New*<br><br>
![](https://i.imgur.com/mRfSIc4.png)

4. After that, you will be greeted by a dialog box as seen below, click on *HTTP Request*<br><br>
![](https://i.imgur.com/1wAT25e.png)

5. You will see an input box in the *GET* section as highlighted below, you will have to put your API key or JSON in this box.<br><br>
![](https://i.imgur.com/sRVBSoL.png)<br><br>
Then all you need to do is press the *Send* button

6. You will then be greeted with the following json response message, typically look for *200 OK* for a successful response<br><br>
![](https://i.imgur.com/ZapU4PC.png)

<br>
Provided you followed all the above steps properly, you have now successfully used Postman to get a postive response from an API.

<br>
<br>

---
## References

- https://www.postman.com
- https://www.postman.com/downloads/
- https://www.javatpoint.com/postman-installation-and-updates
- https://learning.postman.com/docs/getting-started/installation-and-updates/
- https://learning.postman.com/docs/getting-started/installation-and-updates/#installing-postman-on-linux
- https://en.wikipedia.org/wiki/Postman_(software)
- https://github.com/postmanlabs








  
