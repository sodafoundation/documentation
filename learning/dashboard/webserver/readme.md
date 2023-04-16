#	What is a web server?


The Hyper Text Transfer Protocol (HTTP) and other protocols are used by the web server, a piece of hardware and software, to accept and process requests from clients all over the world. The web server displays contents by storing them, then gives users access to the webpages via text, images, videos, and other media. It employs
Physical Storage: To ensure the security of website data, all data is kept on a physical web server. A request is created and sent to the web server to process the data when an end user types the URL of your website into their browser or searches for it using a keyword.
Finding the web server on which to host a website is the responsibility of web browsers like Firefox, Chrome, or Internet Explorer.
## Use of a web server:-
A web server is primarily used to deliver and display website content to users or clients. The following are additional applications for web servers:
• Store and safeguard website data: A web server has the capacity to store and safeguard sensitive website data from unauthorised users.
• Manage bandwidth to control network traffic: A web server can assist in removing downtime brought on by heavy web traffic. In order to control the rate of data transmission over the internet and reduce unnecessary network traffic, web hosts can configure bandwidth.
• Server-side web scripting: This feature enables users to use scripting languages like Ruby, Python, and PHP to create dynamic web pages.
• Virtual hosting: In order to run multiple applications, websites, and data, web servers can also be used as virtual servers.


#	Why do we need web servers?


The purpose of a web server is to store, process, and provide to users any requested data or webpages.
Requests for static material (such as HTML pages, files, pictures, and videos) from a website are accepted by and handled by a web server.Just HTTP requests and answers are handled by web servers.


# What are the different web servers available ?


There are mainly 5 Types of Web Servers:
•	Apache
•	Nginx
•	Microsoft IIS
•	Lighttpd
•	Jigsaw


**Apache :**

The most extensively used and well-liked web server globally is Apache. The Apache Foundation creates and maintains it as open-source software. Since Apache is renowned for its dependability, adaptability, and efficiency, it is frequently used to host websites of all sizes. With a large selection of modules and plugins available to increase its functionality, it is also extremely customisable.
Apache can be used to host dynamic material, such as websites created with server-side programming languages like PHP, in addition to delivering static content, such HTML pages and photos. Moreover, it is capable of acting as a reverse proxy server, which routes requests received from the internet to one or more backend servers.

**Nginx :**

Another well-liked open-source web server, Nginx, is renowned for both its great performance and minimal resource use. It can also be used to cache static information for quicker delivery to consumers. It is frequently used as a reverse proxy server, diverting traffic to other servers and services. High traffic websites are frequently hosted by Nginx, which is frequently used with Apache to distribute the load between the two servers.
The capacity of Nginx to effectively handle a large number of concurrent connections is one of its important characteristics. It can handle requests asynchronously and has an event-driven architecture, making it well-suited to handle heavy traffic levels.

**Microsoft IIS :**

A proprietary web server created by Microsoft for use with the Windows operating system is called IIS (Internet Information Services). With support for many different web technologies and protocols, it is a strong and feature-rich web server. Enterprise environments frequently employ IIS, which is connected with other Microsoft goods like Active Directory and Exchange.
Static web pages, dynamic web pages, and web-based apps can all be hosted on IIS, a powerful and expandable web server. It may be customised with a range of modules and extensions to add new features and capabilities. It supports a variety of programming languages, including ASP.NET, PHP, and Python.

**Lighttpd :**

A free and open-source web server called Lighttpd was created to be small, quick, and effective. Because it is built in C and has a small memory footprint, it is a viable option for hosting busy websites on servers with limited resources.
One of Lighttpd's primary characteristics is its modular architecture, which enables users to quickly alter and expand the server's capabilities. FastCGI, URL rewriting and server-side programming languages like PHP and Ruby are just a few of the features it provides. Moreover, it can be set up to operate with external authentication modules and includes built-in support for SSL/TLS.

**Jigsaw :**

The World Wide Web Consortium (W3C) created the web server Jigsaw as a reference implementation of the HTTP/1.1 protocol. For programmers curious about HTTP protocols and web server technology, Jigsaw is still a popular option.
Jigsaw's modular design, which enables customers to easily adapt and increase the server's capability, is one of its primary benefits. CGI, server-side programming languages like PHP and Python, and SSL/TLS encryption are just a few of the features it provides. Moreover, it includes built-in support for virtual hosting, which enables the hosting of numerous websites on a single server.

#	How to setup and configure Nginx ?

##	Nginx installation on Ubuntu 20.04

A package manager is typically included with every operating system. You have a choice between using apt or apt-get with Ubuntu 20.04. As this is a new server, you first need to update the package manager.

Step 1 :  Upgrade the package management to the most recent version that is compatible:
You can either use the apt or apt-get package manager to install Nginx.
```sudo apt updatesudo apt-get update```
Now, you are ready to install Ngnix. When you are logged in with a non-root account with sudo rights, you will need to prefix every task that requires admin privileges with sudo.

Step 2 : Install Ngnix web server using apt:	
```sudo apt install nginxsudo apt-get install nginx```

Although the service starts automatically after installing Nginx, before you can test whether Nginx is working correctly or not, you will need to configure the OS firewall to access Nginx.

## Configure Firewall for Nginx :

The most popular method for creating iptables' ingress and egress rules. Uncomplicated Firewall, or ufw, is a user-friendly wrapper for iptables that is available in Ubuntu 20.04. Although it comes installed with Ubuntu 20.04 but to make sure that it is appropriately installed, install it manually. After installing Nginx, follow the instructions below to set up the firewall

Step 1: Install ufw:
```sudo apt install ufw```

Step 2: Check if ufw is working fine:
sudo ufw status

Step 3: Allow traffic over HTTP and recheck the status:
sudo ufw allow ‘Nginx HTTP’ 

Step 4: Allow traffic over TCP (OpenSSH) too if you want to log into the machine again:
sudo ufw allow ‘OpenSSH’

Step 5: If the status was inactive when you checked earlier, activate it:
sudo ufw enable

The choice of whether to implement the changes or not will be presented to you. Be aware that you won't be able to enter into the machine again if you deactivate TCP traffic or add a deny OpenSSH rule to the firewall. Let’s now cover some crucial Nginx commands for administration and management

## Nginx Installation and Management :

Step 1: Check the status of the Nginx server:
              sudo systemctl status nginx 
               
Step 2: You can also check if Nginx is working by accessing your website using the browser. Visit the following link:
               http://servermania_server_ip
               
Step 3: Use systemctl to start, stop, or restart your Nginx  server:
sudo systemctl stop nginxsudo systemctl start 
    nginxsudo systemctl restart nginx

Step 4: The Nginx configuration file is found at /etc/nginx/nginx.conf. If you make changes to the configuration, you can either restart the Nginx server or reload the configuration file.
         systemctl reload nginx # reloads Nginx configuration
          
Use the reload command rather than the restart command whenever possible because it doesn't affect any current connections you may have to Nginx.

##	Configure Server Blocks

Similar capability is offered by server blocks and the virtual hosts of Apache Web Server. The most widely utilised server in the LAMP Stack is Apache Web Server. See How to Easily Install Your Own Server for instructions on installing the LAMP stack on ServerMania servers.

You can use more than one domain with your Nginx server thanks to Nginx server blocks. The steps below must be followed in order to set up two domains, domainone.com and domaintwo.com, on the same Nginx server:

Create a directory, one for each domain:

Nginx only creates one server block by default, and it points to the /var/www/html directory. If you simply had one site, this would function flawlessly. All of the website's content is housed in the html subdirectory. For both of your domains, create the html subdirectories.

sudo mkdir -p /var/www/domainone.com/htmlsudo mkdir -p /var/www/domaintwo.com/html

Step 1: Change ownership of the directories:
Doing this will enable the user to create and edit the contents of these new directories.

Step 2: Modify permissions for both the domain directories:
This step is important to make sure that you don’t need root privileges to make changes to any of the sites.
sudo chmod -R 755 /var/www

Step 3: Create sample web pages for each domain/site:
Create a landing page index.html for both domains. Create a basic HTML snippet for a welcome page for both sites.
nano /var/www/domainone.com/html/index.html
Once the editor is open, paste the following into the editor:
<html> <head> <title>Welcome to ServerMania’s Domain One!</title> </head> <body> <h1>You have reached Nginx via Server Block #1</h1> </body></html>
Save the index.html file and create a similar one for the second domain. Make sure you change the welcome message.

Step 4: Create Server Blocks:
As mentioned earlier, by default, Nginx has only one server block. You can find it here — /etc/nginx/sites-available/default. So, we'll need two server blocks because we have two sites to support. The server restricts access to port 80. For our new server blocks, let's replicate the default server block.
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/domainone.com
Similarly, copy the default file and create the second server block too.

Step 5: Mark One of the Two Servers as Default:
You can only have a single default server with the default_server option enabled. Please remove it from one of the server blocks.

Step 6: Enable Server Blocks & Restart Nginx:
You can enable the server blocks by creating symbolic links from the server block configuration files to the sites-enabled directory.
sudo ln -s /etc/nginx/sites-available/domainone.com /etc/nginx/sites-enabled/

Nginx will begin handling requests for both domains from the appropriate blocks that are received on port 80 as soon as you create symbolic links for both domains and restart Nginx.

You can try visiting both domains to test the modifications and check to see if the contents of index.html are rendered correctly.
The installation of Nginx on Ubuntu 20.04 can now begin.








