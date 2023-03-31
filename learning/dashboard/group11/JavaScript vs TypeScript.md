# JavaScript vs TypeScript

## The main differences between JavaScript and TypeScript

-  Type Safety: TypeScript is a statically typed language, which means that every variable and function has a type. This allows for better code organization and easier debugging. On the other hand, JavaScript is a dynamically typed language, which means that types are checked at runtime rather than at compile time.
- Compile Time: TypeScript code needs to be compiled into JavaScript before it can be run, which can be seen as an additional step, but allows for better error checking at the compilation time. In contrast, JavaScript code runs directly in the browser.
- Development Time: With TypeScript, you can catch errors before runtime, which can save development time and prevent bugs in production. In JavaScript, errors may only appear during runtime, leading to longer debugging sessions.
- Object-Oriented Programming: TypeScript is designed with object-oriented programming (OOP) in mind, while JavaScript can be used with or without OOP principles.
- Tooling: TypeScript has a stronger tooling ecosystem with more advanced features like code analysis, automatic refactoring, and code completion. This makes development faster and more efficient. JavaScript tools are also available, but they tend to be less advanced.
- Learning Curve: While TypeScript is built on top of JavaScript, it introduces additional concepts and syntax, making it harder to learn than JavaScript.
-Popularity: JavaScript has been the dominant language for web development for many years, while TypeScript is a more recent addition. However, TypeScript is gaining popularity as more developers see the benefits of a statically typed language.

In conclusion, JavaScript is a dynamic language that is easier to learn and widely used, while TypeScript is a statically typed language that can improve code organization and prevent bugs at development time, but with a steeper learning curve. Which language to use ultimately depends on the specific needs and preferences of the developer and the project.



##### Example Of TypeScript to check whether the user has legal age for voting or not :

```sh
   function checkVotingEligibility(age: number): string {

  if (age >= 18) {

    return "You are eligible to vote!";

  } else {
   
 return "Sorry, you are not old enough to vote.";
  }
}

let ageInput = prompt("Please enter your age:");

let age = parseInt(ageInput);

if (isNaN(age)) {
  
alert("Please enter a valid age.");

} else {
  
  alert(checkVotingEligibility(age));
}
```

##### Example Of JavaScript to check whether the user has legal age for voting or not:

```sh
let age = prompt("Please enter your age:");

if (isNaN(age)) {

  alert("Please enter a valid age.");

} else {
 
  age = Number(age);

  if (age >= 18) {

    alert("You are eligible to vote!");
 
 } else {

    alert("Sorry, you are not old enough to vote.");
  }
}

```
####  To manipulate the DOM (Document Object Model) content and CSS properties via JavaScript, you can use the following methods:

**1.getElementById()**: This method returns a reference to the element with  the specified ID. You can use it to manipulate the content and CSS
properties of the element.

sample code: 
                     var element = document.getElementById(\"myElement\");
                     
                      element.innerHTML = \"New content\"; // change content
                      
                      element.style.color = \"red\"; // change CSS property

**2.querySelector()**: This method returns the first element that matches the specified CSS selector. You can use it to manipulate the content and CSS properties of the element.

sample code: 
                      var element = document.querySelector(\".myClass\");
                      
                      element.innerHTML = \"New content\"; // change content
                      
                      element.style.color = \"red\"; // change CSS property  

**3.getElementsByClassName()**: This method returns a collection of elements with the specified class name. You can use it to manipulate the content and CSS properties of the elements.

sample code: 
                      var elements = document.getElementsByClassName(\"myClass\");
                      
                      for(var i = 0; i \< elements.length; i++)
                      
                      { 
                             elements\[i\].innerHTML = \"New content\"; // change content 
                             
                             elements\[i\].style.color = \"red\"; // change CSS property 
                     
                     } 
                      

**4.getElementsByTagName()**: This method returns a collection of elements with the specified tag name. You can use it to manipulate the content and CSS properties of the elements.

sample code: 
                        var elements = document.getElementsByTagName(\"p\");
                        
                      for (var i =0; i \< elements.length; i++) 
                     
                     {
                         
                         elements\[i\].innerHTML = \"New content\"; // change content 
                          
                          elements\[i\].style.color = \"red\"; //change CSS property 
                     } 

These methods allow you to select elements on the page and manipulate their content and CSS properties dynamically with JavaScript.

Here are some resources you can use to learn more about manipulating the DOM and CSS properties via JavaScript

``<https://developer.mozilla.org/enUS/docs/Web/API/Document_Object_Model>``

``<https://javascript.info/searching-elements-dom>``

``<https://www.w3schools.com/js/js_htmldom_elements.asp>``






