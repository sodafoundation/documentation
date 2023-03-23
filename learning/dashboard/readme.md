**What is Angular Routing**

In a single-page app, you change what the user sees by showing or hiding portions of the display that correspond to particular components, rather than going out to the server to get a new page. As users perform application tasks, they need to move between the different views that you have defined.

To handle the navigation from one view to the next, you use the Angular Router. The Router enables navigation by interpreting a browser URL as an instruction to change the view.

To explore a sample app featuring the router's primary features, see the example below
router.zip file with the reference link.

Reference Link : https://angular.io/guide/routing-overview
 
 
 **How to Use Angular Routes**

Using Angular routes in a single-page application
It describes how to build a single-page application, SPA that uses multiple Angular routes.

In a Single Page Application (SPA), all of your application's functions exist in a single HTML page. As users access your application's features, the browser needs to render only the parts that matter to the user, instead of loading a new page. This pattern can significantly improve your application's user experience.

To define how users navigate through your application, you use routes. Add routes to define how users navigate from one part of your application to another. You can also configure routes to guard against unexpected or unauthorized behavior.

To explore a sample application featuring the contents of this tutorial, see the example with this link
https://stackblitz.com/run?file=src%2Fapp%2Fapp.component.html

Reference link :  https://angular.io/guide/router-tutorial

**Installation** 

To install Angular using CLI write this line on your terminal,
    npm install -g @angular/cli

To create  workspace named my-app,
    ng new my-app

To run the application enter the following lines on your terminal,
    cd my-app
    ng serve --open
    
After this the Angular application will be launched on your browser at localhost:4200,
(default port for Angular based apps).


**Data passing in Angular**

In an Angular application, we may have multiple components with a variety of functionality/features and while developing an application we may come across a situation where we need to share or pass the data from one component to another one, in that case, we can achieve that by using the concept of data sharing between the components, and for that in Angular, there are some provisions or ways to achieve the same.

Methods:

Parent to Child: via Input
Child to Parent: via Output() and EventEmitter
Child to Parent: via ViewChild
Unrelated Components: via a Service

The contents were taken from dotnettricks, to learn more about data passing in angular visit: https://www.dotnettricks.com/learn/angular/sharing-data-between-angular-components-methods .
