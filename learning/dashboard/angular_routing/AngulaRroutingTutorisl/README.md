**Angular**


Angular is a development platform, built on TypeScript. As a platform, Angular includes:

  A component-based framework for building scalable web applications.

  A collection of well-integrated libraries that cover a wide variety of features, including routing, forms management, client-server communication, and more.

  A suite of developer tools to help you develop, build, test, and update your code.

With Angular, you're taking advantage of a platform that can scale from single-developer projects to enterprise-level applications. Angular is designed to make updating as straightforward as possible, so take advantage of the latest developments with minimal effort.


**Angular Installation** 


To install Angular using CLI write this line on your terminal,
    npm install -g @angular/cli

To create  workspace named my-app,
    ng new my-app

To run the application enter the following lines on your terminal,
    cd my-app
    ng serve --open
    
After this the Angular application will be launched on your browser at localhost:4200,
(default port for Angular based apps).


**What is Angular Routing**


In a single-page app, you change what the user sees by showing or hiding portions of the display that correspond to particular components, rather than going out to the server to get a new page. As users perform application tasks, they need to move between the different views that you have defined.

To handle the navigation from one view to the next, you use the Angular Router. The Router enables navigation by interpreting a browser URL as an instruction to change the view.

To explore a sample app featuring the router's primary features, see the example below
router.zip file with the reference link. 
 
 
 **How to Use Angular Routes**


Using Angular routes in a single-page application
It describes how to build a single-page application, SPA that uses multiple Angular routes.

In a Single Page Application (SPA), all of your application's functions exist in a single HTML page. As users access your application's features, the browser needs to render only the parts that matter to the user, instead of loading a new page. This pattern can significantly improve your application's user experience.

To define how users navigate through your application, you use routes. Add routes to define how users navigate from one part of your application to another. You can also configure routes to guard against unexpected or unauthorized behavior.


**Data passing in Angular**


In an Angular application, we may have multiple components with a variety of functionality/features and while developing an application we may come across a situation where we need to share or pass the data from one component to another one, in that case, we can achieve that by using the concept of data sharing between the components, and for that in Angular, there are some provisions or ways to achieve the same.

Methods:

  Parent to Child: via Input,

  Child to Parent: via Output() and EventEmitter,

  Child to Parent: via ViewChild,

  Unrelated Components: via a Service.


**Why is data passed between Angular components:**


Angular provides component based architecture that allows modularizing the application. It means you can create multiple chunks, and convert your large component to a smaller segment that can be easily maintained. The main advantage to do this is easily understanding the component and maintenance of code. In this scenario, it is important for communication between components or share the data between the component. 

Angular provides multiple ways to share the data between the components. Based on your need and kind of component relation, you can select any of the methods. It is recommended to use the service method as it is independent of component relation and helps you to send data to multiple components. 


**How to pass the data between angular  routes?**


The task is to share data variables between two or more controllers by using AngularJS. There are many procedures to achieve this. Here we will discuss the most popular ones. 

Approach: 

To share data between the controllers in AngularJS we have two main cases:

Share data between parent and child: Here, the sharing of data can be done simply by using controller inheritance as the scope of a child controller inherits from the scope of the parent controller.
Share data between controllers without having a relation: Here, the sharing of data can be done in a few ways some of them are: 

By using the rootScope variable:

We can use the rootScope variable to hold shared data and then can reference it from any controller. Here, at the start of the Angular app, we initialized the rootScope variable with some value and then refer it from every controller and thus binding scope variables in both controllers to the rootScope variable.

By using factory or service:

The $rootscope method is not preferred for data transfer or sharing data because it has a global scope that is available for the entire application. So, we use another method in which we create a factory or service to hold share data. AngularJS factories and services are JS functions that perform a specific task containing both methods & properties and can be injected into other components (e.g. your controllers) using dependency injection. In this way we can define a shared variable in a factory, inject it into both controllers and thus bind scope variables in both controllers to this factory data.



[Link for a simple Angular application to demonstrate routing:]
(https://github.com/ShambhaviVijay/AngularAce)


[References:]

(https://www.geeksforgeeks.org)
(https://angular.io/guide/router-tutorial)
(https://www.c-sharpcorner.com/article/sharing-the-data-between-components-in-angular)
(https://www.dotnettricks.com/learn/angular/sharing-data-between-angular-components-methods)
(https://stackblitz.com/run?file=src%2Fapp%2Fapp.component.html)
(https://angular.io/guide/routing-overview)
(https://angular.io/guide/what-is-angular)

