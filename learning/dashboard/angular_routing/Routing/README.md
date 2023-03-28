# ANGULAR


Angular is a development platform, built on TypeScript. As a platform, Angular includes:

  A component-based framework for building scalable web applications.

  A collection of well-integrated libraries that cover a wide variety of features, including routing, forms management, client-server communication, and more.

  A suite of developer tools to help you develop, build, test, and update your code.

With Angular, you're taking advantage of a platform that can scale from single-developer projects to enterprise-level applications. Angular is designed to make updating as straightforward as possible, so take advantage of the latest developments with minimal effort.


### **Angular Installation** 


To install Angular using CLI write this line on your terminal,
   ``` npm install -g @angular/cli ```

To create  workspace named my-app,
   ``` ng new my-app ```

To run the application enter the following lines on your terminal,
  ``` cd my-app ```
  ``` ng serve --open```
    
After this the Angular application will be launched on your browser at localhost:4200,
(default port for Angular based apps).


# ROUTING IN ANGULAR


### **What is Angular Routing**


In a single-page app, you change what the user sees by showing or hiding portions of the display that correspond to particular components, rather than going out to the server to get a new page. As users perform application tasks, they need to move between the different views that you have defined.

To handle the navigation from one view to the next, you use the Angular Router. The Router enables navigation by interpreting a browser URL as an instruction to change the view.

To explore a sample app featuring the router's primary features, see the example below
router.zip file with the reference link. 
 
 
### **How to Use Angular Routes**


Using Angular routes in a single-page application
It describes how to build a single-page application, SPA that uses multiple Angular routes.

In a Single Page Application (SPA), all of your application's functions exist in a single HTML page. As users access your application's features, the browser needs to render only the parts that matter to the user, instead of loading a new page. This pattern can significantly improve your application's user experience.

To define how users navigate through your application, you use routes. Add routes to define how users navigate from one part of your application to another. You can also configure routes to guard against unexpected or unauthorized behavior.


# DATA PASSING 


### **Data passing in Angular**


In an Angular application, we may have multiple components with a variety of functionality/features and while developing an application we may come across a situation where we need to share or pass the data from one component to another one, in that case, we can achieve that by using the concept of data sharing between the components, and for that in Angular, there are some provisions or ways to achieve the same.

#### Methods:

  Parent to Child: via Input,

  Child to Parent: via Output() and EventEmitter,

  Child to Parent: via ViewChild,

  Unrelated Components: via a Service.


### **Why is data passed between Angular components:**


Angular provides component based architecture that allows modularizing the application. It means you can create multiple chunks, and convert your large component to a smaller segment that can be easily maintained. The main advantage to do this is easily understanding the component and maintenance of code. In this scenario, it is important for communication between components or share the data between the component. 

Angular provides multiple ways to share the data between the components. Based on your need and kind of component relation, you can select any of the methods. It is recommended to use the service method as it is independent of component relation and helps you to send data to multiple components. 


### **How to pass the data between angular  routes?**


The task is to share data variables between two or more controllers by using AngularJS. There are many procedures to achieve this. Here we will discuss the most popular ones. 

#### Approach: 

1.** Using a service**: We can design a shared service that has the information we want the controllers to exchange. The    controllers can inject the service to access the data, and the service may include methods to configure and obtain the data. This method is advised for data exchange across components without a clear parent-child relationship.


*** Utilizing the @Input() and @Output() decorators**: We can transfer data between parent and child components using the @Input() and @Output() decorators. A parent component can supply data to a child component using the @Input() decorator, and a child component can emit events to a parent component using the @Output() decorator.

* **ViewChild**: ViewChild can be used to access the properties and methods of the child component from the parent component. When we need to use the data or methods of the child component from the parent component, this way is helpful.

* **With ngRx**: We can implement a reactive strategy for data sharing between components using the ngRx module. The Redux pattern is the foundation of ngRx, which offers a centralised store for controlling application state. Components can dispatch actions to change the state and subscribe to the shop to get updates when the state changes.

# TUTORIAL APP


Link for a simple Angular application to demonstrate routing: <br>

[ANGULAR-ACE (demo app) ](https://github.com/ShambhaviVijay/AngularAce-))


# REFERENCES:

[GEEKFORGEEKS](https://www.geeksforgeeks.org) <br>
[ANGULAR OFFICIAL DOCUMENTATION](https://angular.io/guide/router-tutorial) <br>
[C-SHARPCORNER](https://www.c-sharpcorner.com/article/sharing-the-data-between-components-in-angular) <br>
[NOTNETTRICKS](https://www.dotnettricks.com/learn/angular/sharing-data-between-angular-components-methods) <br>
[STACKBLITZ](https://stackblitz.com/run?file=src%2Fapp%2Fapp.component.html) <br>

