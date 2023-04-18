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
![](https://i.postimg.cc/HxGz8yZ3/image-2023-04-14-173433882.png)<br><br>
 
 > For downloading the app for Windows, click on the download button and select the particular version. If you are using a 32-bit OS, you can choose the 32 bit option instead. 
 
 <br>

* Once the .exe file is downloaded, you need to install the application. <br><br>
![](https://i.postimg.cc/Z5fmFTp1/image-2023-04-14-174101132.png)<br><br>

> It is preferable to create an account as this will help you to save the work you do within Postman, and with this, you won't lose any work.

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

<br>

## Intermediate Usage and Further Information

<br>

> We will be using a [very simple API developed for books](https://github.com/vdespa/introduction-to-postman-course/blob/main/simple-books-api.md) for the following steps. This section will cover some slightly more advanced usage of Postman as well the explanation of endpoints, how variables work and environments. 

<br>

### *Workspaces*
*Workspaces in Postman allow you to organize your work and even collaborate with team members on projects. You can group your projects together with the workspace you set up acting as a hub of related APIs, collections, environments, mocks, monitors, and other linked entities.*

<br>

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

### *Collections*
*Collections in Postman are essentially compilations of saved requests and variables. The latter is discussed further on.*

<br>

To give your request a proper title you will have to save it to a collection.

- Click the *Save* button in the top-right corner. <br><br>
![](https://i.postimg.cc/j5qFX54n/image-2023-04-15-190016719.png) <br><br>
- If this is your first time using Postman, you will likely not have any pre-existing collections to save your request to, so you will first have to make one. Click on *Create Collection*. <br><br>
![](https://i.postimg.cc/kMZN54zM/image-2023-04-15-190352931.png) <br><br>
- Give your collection a name. <br><br>
![](https://i.postimg.cc/fTT5rLpM/image-2023-04-15-190902284.png)<br><br>
> Note that you can also do this by selecting the Collections tab and clicking the '+' icon

<br>

- You can now save your request to your newly created collection. <br><br>
![](https://i.postimg.cc/B6cZXsTn/image-2023-04-15-191211558.png)
![](https://i.postimg.cc/SNjTtVsS/image-2023-04-16-185153973.png)
> Notice the orange dot next to your request tab. It is an indication that you haven't saved the tab since some work you did in. Make it a practise to frequently save your request tabs when working in Postman.
- Now copy and paste the link to the source of the API you're using, which in this case is `https://simple-books-api.glitch.me` for the simple book API. <br><br>
![](https://i.postimg.cc/527XZhqY/image-2023-04-15-200119592.png) <br><br>
This link, with the inclusion of any modifications made to it, is what's known as the **Request URL**.

<br>

### *Request methods*
*Let us now discuss what that `GET` beside the request URL means. The nature of HTTP requests allows to specify the context in which you are interacting with the API, i.e., whether your request URL will serve primarily as a request to the API to recieve an input or produce an output and furthermore what kind of input to take or output to give. To that effect there are several* Request methods *in Postman. The most commonly used ones are:* 

*1.* *GET* <br>
*2.* *POST* <br>
*3.* *PATCH* <br>
*4.* *DELETE* <br>

*In Postman any request you create will use the `GET` method by default. The `GET` method is used to retrieve information from the API. Requests using this method should only retrieve data and should have no other effect on the data. The usage of the other methods will be explained later on through the course of this tutorial.*

<br>

### *Endpoints* 
*An endpoint is a URL pattern used to communicate with an API. It is essentially a way through which a user or an application can interact with other applications. For example, If you add `status` to the request URL to get `https://simple-books-api.glitch.me/status`, then that `status` you just added would become an endpoint for that link.*

<br>

Adding the `status` endpoint to the request URL beforing hitting *Send* would give you this output: 
> Note that while some endpoints like `status` are common in most APIs, many more are specific to individual ones. 

![](https://i.postimg.cc/DyjZ7fnQ/image-2023-04-16-185429831.png)

> Notice the *200 OK* status message. If an error occurs due to the incorrect structuring of your request URL or anything else your output will look different to what is seen above and the status message will display *404 not found* or a variation of that.

The request URL as it is right now might look a little complicated, but it is possible to simplify it a bit through the use of variables.

<br>

### *Variables*
*Variables enable you to store and reuse values in Postman. By storing a value as a variable, you can reference it throughout your collections, environments and requests.* 

<br>

Since `https://simple-books-api.glitch.me` is going to be a recurring base point for the Request URL, its value can simply be assigned to variable and reused later.

<br>

- Select the base URL and then click *Set as variable*, then click on *Set as new variable*. <br><br>
![](https://i.postimg.cc/CM2HqHs9/image-2023-04-16-211324491.png)
![](https://i.postimg.cc/D0W2bKPJ/image-2023-04-16-211646429.png) <br><br>

- Specify the name and scope of your variable. <br><br>
![](https://i.postimg.cc/vTd99H64/image-2023-04-16-221248025.png) <br><br>
 As you can see, there are three ways you can go about this. <br><br>

> `Global` <br> If you set your variable's scope to *Global* it can be referenced across every collection, request and test case you make in Postman.

> `Environment` <br> If you set your variable's scope to *Active Environment*, it will referenced only in the currently active environment, more on this later.

> `Collection` <br> If you set your variable's scope to *Collection*, it will be referenced only within the collection you're creating the variable in. 

<br>

- Choose *Collection* for now. *Global* would work similarly in this scenario though since you have made only one collection so far.

- If you click on your collection and then navigate to *Variables* you should be able to see your variable. <br><br>
![](https://i.postimg.cc/DzRhZVkp/image-2023-04-16-220916216.png) <br><br>

> You can also add a new collection scope variable by interacting with table above and specifiying the *initial value*

- Now replace `https://simple-books-api.glitch.me` in your request URL with the name you gave it in double curly braces as per the general syntax, `{{base}}` in this case, and send the request again. It should work just as it did before. <br><br>
![](https://i.postimg.cc/q7tx3xLq/image-2023-04-16-222645809.png) <br><br>

Now that the request URL is a little easier to read, let's use another endpoint with the `GET` method.

- The `books` endpoint when added to the request URL will return a list of books <br><br>
![](https://i.postimg.cc/XJPf7GFF/image-2023-04-16-223022815.png) <br><br>

### *Query Parameters*
*Query parameters are appended to the end of the request URL, usually following an endpoint and a '?', and are listed in key value pairs, separated by '&' using the following syntax in which `test` is a query parameter:*

```
<base-request-URL>/<endpoint>?test=<respective-value>
```

<br>

- This API allows you to use the `type` query parameter after the `books` endpoint to specify whether you want fiction or non-fiction books. You can implement this either by following the syntax and typing `?type=(fiction/non-fiction)` after the base of the request URL (which is saved as `base` here) or by simply adding the parameter more intuitively into the table provided in the *Params* tab under the request URL. <br><br>
![](https://i.postimg.cc/6pvWqpC2/image-2023-04-17-082257705.png) <br><br>

- You can also use multiple query parameters by separating them with an '&' in the request URL or by interacting with the table. For instance, we can use the `limit` query parameter to limit the book results produced by the API, in tandem with the `type` query parameter. <br><br>
![](https://i.postimg.cc/cHq0kSXv/image-2023-04-18-164304458.png) <br><br>

### *Path Variables*
*You can use Path Variables with your endpoints to add more specificity to your requests. They work differently from query parameters and follow the follwing syntax where `test` is a path variable.*
```
<base-URL>/<endpoint>:/test
```
*You cannot directly assign values to path variables in the request URL.*

<br>

- Using the `bookId` with the `books` endpoint will bring up detailed information the book whose ID is the same as `bookId`'s value. You can assign that value using the path variable table under *Params*. <br><br>
![](https://i.postimg.cc/8Cw2Y647/image-2023-04-18-174254756.png)


Let's move on to another request method. The `POST` request method is used to send data to the server, for example, customer information, file uploads, etc. using HTML forms. While `GET` so far was used to get an output, `POST` will be used to give input.

- Make a new request by opening a new request tab and saving the new request to the collection you were working in previously. This step isn't necessary but it helps disambiguate requests a little since we're using different request methods. <br><br>
![](https://i.postimg.cc/0283hqcz/image-2023-04-18-180738572.png) <br><br>
![](https://i.postimg.cc/RZ0wkgk1/image-2023-04-18-180834599.png) <br><br>
![](https://i.postimg.cc/cCCKJBYq/image-2023-04-18-182414731.png) <br><br>

- Change the request method beside the request URL from `GET` to `POST` in the new request tab.

Some APIs will require you to register your API client (Postman in this case) in order to use the functionality of certain endpoints. Upon properly registering your API client you will be given an access token to that effect.

- Add your base URL variable and the `api-clients` endpoint to the request URL <br><br>
![](https://i.postimg.cc/GpRM78RZ/image-2023-04-18-192652708.png) <br><br>

- Click the *Body* tab under the request URL, then select *raw* and specify the body as *JSON* <br><br>
![](https://i.postimg.cc/W4DM7sFQ/image-2023-04-18-192845921.png) <br><br>
The [Book API's guide](https://github.com/vdespa/introduction-to-postman-course/blob/main/simple-books-api.md#api-authentication) suggests the following syntax while sending your credentials in JSON format.  
```
{
   "clientName": "name",
   "clientEmail": "name@example.com"
}
``` 
This code in JSON format constitutes the **request body**. Any special input sent to an API is sent through the request body.

<br>

- Follow the syntax by providing a name and corresponding email address and hit *Send*. You will receive an access token. <br><br>
> The text you entered in
![](https://i.postimg.cc/sxtXsRDZ/image-2023-04-18-193110014.png)
> Notice the different status message.

The API will provide you (your current credentials) with an access token only **once**, meaning that if you try to repeat the previous steps you will be met with an error message. So it is recommeded that you save the access token as a variable immediately. 

- Copy the value of the access token (without the quotes), then navigate to your colelction, enter it as a variable and name it. Save your collection after doing so. <br><br>
![](https://i.postimg.cc/9FN21tCL/image-2023-04-18-204203978.png) 
> Leave your *initial value* as `---` here. The initial value of a variable is usually visible to all clients in a public API and in most cases it is not advisable to make sensitive information like your access token public.

- Go back to your previous request tab, and navigate to *Authorization*. Change the *Type* to *Bearer Token* in the drop-down menu. <br><br>
![](https://i.postimg.cc/Rhvmb4sm/image-2023-04-18-205613211.png) <br><br>

- Assign the access token variable you created earlier to the the value of *Token*. Save after doing so.<br><br>
![](https://i.postimg.cc/RVZ0dLJY/image-2023-04-18-210027905.png) <br><br>

Now that we've set up our access token, we can use another endpoint with the `POST` method. 

- Now use the `orders` endpoint to order a book, following the syntax as seen in the image. <br><br>
![](https://i.postimg.cc/h41xqd68/image-2023-04-18-214341800.png) <br><br>
If you use the same endpoint with the `GET` request method you should be able to see a summary of your order.  <br><br>
![](https://i.postimg.cc/C1d4Ly6g/image-2023-04-18-215220668.png)
> Note that if you use a different request tab to do this you will again have to update the *Bearer Token* under *Authorization* with your access token variable for that request tab.

<br>

We will now look at the `PATCH` request method. The `PATCH` request method is essentially used to update partial resources. For instance, when you only need to update one field of the resource, inputting a complete resource representation via `PUT` might be cumbersome and utilize more bandwidth than a simple `PATCH` request. <br><br>

- Create a new request tab, give it a meaningful name, and then save it to your collection like you did with the previous one. Change the request method to `PATCH` and add your base URL's variable to the request URL. Also set up the bearer token like you did in the previous tab.

- When used in the `PATCH` method, the `orders` endpoint along with the `orderId` path variable can be used to update an existing order, namely by just changing the customer name. You will need the ID of the order made previously to carry out this request so either send a `GET` request with the `orders` and copy it from the output, or just copy it from the tab you just finished that request in. <br><br>
![](https://i.postimg.cc/vZncVY6H/image-2023-04-18-223709550.png) <br><br>

- Update the path variable for `orderId` under *Params* with the order ID you just copied. <br><br>
![](https://i.postimg.cc/PrqpQSyL/image-2023-04-18-224919588.png) <br><br>

- Navigate to *Body*, set to *raw* and change it's format to *JSON*. Then update it your order by changing the customer name and hit *Send*. <br><br>
![](https://i.postimg.cc/BnxQHzkf/image-2023-04-18-225531804.png) <br><br>
If you use `orders` with `GET` again, you will be able to see the change you just made. <br><br>
![](https://i.postimg.cc/5y7st185/image-2023-04-18-230043700.png)

Lastly, let's use the `DELETE` method to delete the order we just made. The `DELETE` request method is used to delete specified resources.

- Create another request tab, name it, save it to your collection and set up the *Bearer Token*.

- When used in the `DELETE` method, the `order` endpoint with the `ordersId` path variable can be used to delete an existing order. You will need the ID of the order to do this.

> Notice how the same endpoint has had different use cases across different request methods.

- Specify `orderId`'s value under *Params* and hit *Send* <br><br>
![](https://i.postimg.cc/g2W64bDc/image-2023-04-18-232248749.png) 

> Unlike in `POST` and `PATCH`, you will not need to include or specify a request body in this request.

- As you can see here, from sending a `GET` request with the `orders` endpoint, the order has been deleted. <br><br>
![](https://i.postimg.cc/g2W64bDc/image-2023-04-18-232248749.png) <br><br>

Provided you followed this section properly you should now a have better understanding of the usage of Postman

<br>
<br>

---
## References

- https://www.postman.com
- https://www.postman.com/downloads/
- https://www.javatpoint.com/postman-installation-and-updates
- https://learning.postman.com/docs/getting-started/installation-and-updates/
- https://learning.postman.com/docs/getting-started/creating-the-first-collection
- https://learning.postman.com/docs/collaborating-in-postman/using-workspaces/creating-workspaces
- https://en.wikipedia.org/wiki/Postman_(software)
- https://github.com/postmanlabs

All the images used in this documentation are sourced from: https://postimg.cc/gallery/qdxZs8Q

