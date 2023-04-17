# **Postman:** 101

<br>

![](https://i.postimg.cc/G3NzwvKt/image-2023-04-14-172950620.png)

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

This tutorial was created for those who would like to learn the basics of Postman. As the number of web and mobile applications is increasing, the importance of API testing is also growing. So this tutorial will help you to learn postman testing for testing APIs.

After completion of this tutorial, you will get a basic level of understanding of Postman and API testing. This tutorial will also give you a good understanding of how to use Postman to execute APIs for any given URL for your daily work.
<br>
<br>

## Installation, Setup and Updates

<br> 

 > Postman can be downloaded for all major operating systems, including Mac, Linux, and Windows, as a native app (standalone application). Postman is also available as a chrome extension application, but it is preferable to install and use the native desktop app because the extension does not support all the features that the native app has.

 <br>

### Downloading and installing the native Postman application on Windows

<br>

* Go to  [this link](https://www.postman.com/downloads/) and click *Download* for Windows.<br><br>
![](https://i.postimg.cc/HxGz8yZ3/image-2023-04-14-173433882.png)<br>
 *For downloading the app for Windows, click on the download button and select the particular version. If you are using a 32-bit OS, you can choose the 32 bit option instead.* <br><br>

* Once the .exe file is downloaded, you need to install the application. <br><br>
![](https://i.postimg.cc/Z5fmFTp1/image-2023-04-14-174101132.png)<br>
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

![](https://i.postimg.cc/FR2PvhH6/image-2023-04-14-175939859.png)<br><br>
Either way, this is the simplest method to install Postman on Linux/Ubuntu systems.

<br>

### Setting up Postman for proper usage on Linux and Windows

<br>

> *While these screenshots were taken in Windows, the process henceforth will be the same in a Linux environment.*

<br>

* Create your account with all the required details, or sign up with Google, as shown in the image.<br><br>
![](https://i.postimg.cc/pXYpKkzh/image-2023-04-14-180114098.png)

* After signing in, select the workspace tools as per your requirement, and then click on, continue to get the startup screen.<br><br>
![](https://i.postimg.cc/Z5gr9Vrk/image.png)

* You will see the following page, and then you are ready to use Postman.<br><br>
![](https://i.postimg.cc/L8CMjZXF/image-2023-04-14-180739584.png)
<br>
<br>

### Steps to update the Postman desktop client

<br>

* You will receive a notification in your Postman app if any update is available.

* To download or install the latest update, click on the *Settings* icon, as shown in the image below, then go to *Update*.<br><br>
![](https://i.postimg.cc/DfCbNxm9/image.png)

* You can change the update settings by enabling the *Automatically download major updates* setting, as shown in the image below.<br><br>
![](https://i.postimg.cc/ydLWwN6m/image.png)

* You can also check for the latest updates by clicking on *Check for updates*, which will show you if any new update is available.

* You will have to select the update option to download and install the latest update. When the download is complete, you will see a notification asking you to restart the app to install the updated features.

* It automatically downloads minor updates and bug fixes.

<br>

*Note that if you install Postman in a Linux environment you may not have the* Check for updates *option. This is because the updates are handled by the snap store, which automatically updates Postman on a regular basis.*

<br>

## Basic Usage

<br>

> The following steps will show you how to use Postman after properly installing and setting it up. Consider this a trial run if you are using Postman for the first time.

<br>

1. Open your Postman desktop application.

2. Open Postman and select *Workspaces*.<br><br>
![](https://i.postimg.cc/tg9Y4cTC/image-2023-04-14-181343781.png)

3. In the workspace section section, click on *New*.<br><br>
![](https://i.postimg.cc/5Nx4vzJn/image-2023-04-14-181442008.png)

4. After that, you will be greeted by a dialog box as seen below, click on *HTTP Request*.<br><br>
![](https://i.postimg.cc/m2zs7yq3/image-2023-04-14-181637506.png)

5. You will see an input box in the *GET* section as highlighted below, you will have to put your API key or JSON in this box.<br><br>
![](https://i.postimg.cc/Kc79wkTX/image-2023-04-14-181725497.png)
*As you can see here we've used a JSON from a [crowdsourced database that tracked the coronavirus in India](https://data.covid19india.org).*<br><br>
Then all you need to do is press the *Send* button.

6. You will then be greeted with the following json response message, typically look for *200 OK* for a successful response.<br><br>
![](https://i.postimg.cc/V6fSNVKW/image-2023-04-14-181804701.png)

<br>
Provided you followed all the above steps properly, you have now successfully used Postman to get a postive response from an API. 
<br><br>

## Intermediate Usage and Further Information

<br>

> We will be using a [very simple API developed for books](https://github.com/vdespa/introduction-to-postman-course/blob/main/simple-books-api.md) for the following steps. This section will cover some slightly more advanced usage of Postman as well the explanation of endpoints, how variables work and environments. 

<br>

### Workspaces

First off, you will need to create a workspace and get a request tab set up like earlier.

- Go to *Workspaces* and click on new *Create Workspace*. <br><br> 
![](https://i.postimg.cc/xdTKBJF9/image-2023-04-15-183439091.png)<br><br>

- Name your workspace and give it a meaningful summary. You can make your workspace personal, team-oriented, private, public or partner-oriented, but for now we'll just make it personal. <br><br>
![](https://i.postimg.cc/8zNcndJ0/image-2023-04-15-181839594.png)
![](https://i.postimg.cc/kMVDzXjW/image-2023-04-15-182657120.png)<br><br>

- On the left pane of your Postman window, click on *New*. <br><br>
![](https://i.postimg.cc/gkpKzYY5/image-2023-04-15-184331801.png)<br><br>
- Then click on *HTTP Request*. <br><br>
![](https://i.postimg.cc/x8vXCJv4/image-2023-04-15-184851721.png)<br><br>

This will make an untitled HTTP request as seen below. <br><br>
![](https://i.postimg.cc/j5Z7QJwn/image-2023-04-15-185020949.png)<br><br>

### Collections
To give your request a proper title you will have to save it to a collection, which is nothing but a compilation of requests.

- Click the *Save* button in the top-right corner. <br><br>
![](https://i.postimg.cc/j5qFX54n/image-2023-04-15-190016719.png) <br><br>
- If this is your first time using Postman, you will likely not have any pre-existing collections to save your request to, so you will first have to make one. Click on *Create Collection*. <br><br>
![](https://i.postimg.cc/kMZN54zM/image-2023-04-15-190352931.png) <br><br>
- Give your collection a name. <br><br>
![](https://i.postimg.cc/fTT5rLpM/image-2023-04-15-190902284.png)
> Note that you can also do this by clicking the Collections tab, then clicking the '+' icon and renaming it if you wish 
- You can now save your request to your newly created collection. <br><br>
![](https://i.postimg.cc/B6cZXsTn/image-2023-04-15-191211558.png)
![](https://i.postimg.cc/SNjTtVsS/image-2023-04-16-185153973.png) <br><br>
- Now copy and paste the link to the source of the API you're using, which in this case is `https://simple-books-api.glitch.me` for the simple book API. <br><br>
![](https://i.postimg.cc/527XZhqY/image-2023-04-15-200119592.png) <br><br>
This link, with the inclusion of any modifications made to it, is what's known as the **Request URL**.

<br>

### Request methods
Let us now discuss what that `GET` beside the request URL means. The nature of HTTP requests allows to specify the context in which you are interacting with the API, i.e., whether your request URL will serve primarily as a request to the API to recieve an input or produce an output and furthermore what kind of input to take or output to give. To that effect there are several *Request methods* in Postman. The most commonly used ones are: 

1. GET
2. POST
3. PATCH
4. DELETE

In Postman any request you create will use the `GET` method by default. The `GET` method is used to retrieve information from the API. Requests using this method should only retrieve data and should have no other effect on the data. The usage of the other methods will be explained later on through the course of this tutorial.

<br>

### Endpoints 
An endpoint is a URL pattern used to communicate with an API. It is essentially a way through which a user or an application can interact with other applications. For example, If you add `status` to the request URL to get `https://simple-books-api.glitch.me/status`, then that `status` you just added would become an endpoint for that link.

<br>

Adding the `status` endpoint to the request URL beforing hitting *Send* would give you this output: <br><br>
![](https://i.postimg.cc/DyjZ7fnQ/image-2023-04-16-185429831.png)
*Notice the* Status: 200 OK *message*

> Note that while some endpoints like `status` are common in most APIs, many more are specific to individual ones. 

The request URL as it is right now might look a little complicated, but it is possible to simplify it a bit through the use of variables.

<br>

### Variables
Variables enable you to store and reuse values in Postman. By storing a value as a variable, you can reference it throughout your collections, environments and requests. Since `https://simple-books-api.glitch.me` is going to be a recurring base point for the Request URL, its value can simply be assigned to variable and reused later.

- Select the base URL and then click *Set as variable*, then click on *Set as new variable*. <br><br>
![](https://i.postimg.cc/CM2HqHs9/image-2023-04-16-211324491.png)
![](https://i.postimg.cc/D0W2bKPJ/image-2023-04-16-211646429.png) <br><br>

- Specify the name and scope of your variable. <br><br>
![](https://i.postimg.cc/vTd99H64/image-2023-04-16-221248025.png) <br><br>
 As you can see there are three ways you can go about this. <br><br>

> `Global` <br> If you set your variable's scope to *Global* it can be referenced across every collection, request and test case you make in Postman.

> `Environment` <br> If you set your variable's scope to *Active Environment*, it will referenced only in the currently active environment, more on this later.

> `Collection` <br> If you set your variable's scope to *Collection*, it will be referenced only within the collection you're creating the variable in. 

<br>

- Choose *Collection* for now. *Global* would work similarly in this scenario though since you have made only one collection so far.

- If you click on your collection and then navigate to *Variables* you should be able to see your variable <br><br>
![](https://i.postimg.cc/DzRhZVkp/image-2023-04-16-220916216.png) <br><br>

- Now replace `https://simple-books-api.glitch.me` in your request URL with the name you gave it in double curly braces, `{{base}}` in this case, and send the request again. It should work just as it did before. <br><br>
![](https://i.postimg.cc/q7tx3xLq/image-2023-04-16-222645809.png) <br><br>

Now that the request URL is a little easier to read, let's use another endpoint with the `GET` method.

- The `books` endpoint will return a list of books <br><br>
![](https://i.postimg.cc/XJPf7GFF/image-2023-04-16-223022815.png) <br><br>

> *Query Parameters* <br> Query parameters are appended to the end of the request URL, following a '?' and are listed in key value pairs, separated by '&' using the following syntax: `?id=1&type=new`

<br>

- This API allows you to use the `type` parameter after the `books` endpoint to specify whether you want fiction or non-fiction books. You can implement this either by following the general syntax and typing `?type=(fiction/non-fiction)` after the rest of the request URL or by simply adding the parameter more intuitively into the table provided the *Params* tab under the request URL. <br><br>
![](https://i.postimg.cc/MKz6pW03/image-2023-04-16-225327088.png)

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

All the images used in this documentation are sourced from: https://postimg.cc/gallery/qdxZs8Q

