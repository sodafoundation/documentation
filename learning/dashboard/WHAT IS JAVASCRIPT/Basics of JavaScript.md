# Most commonly used JS methods

## 1.console.log()
  In JavaScript, console.log() is a method that is used to output information to the console. The console is a tool that is built into web browsers and is used for debugging purposes.
      The console.log() method takes one or more arguments that can be any type of data, such as strings, numbers, objects, or arrays. It then prints the value of each argument to the console.This method is a powerful tool for debugging your JavaScript code and for printing information to the console during development.

**Here's an example of how to use console.log():**
``` javascript
let message = "Hello, world!";
      console.log(message);
```
***When you run this code, you will see the following output in the console:
    >Hello, world!***
    

<br>

## 2.alert()

  In JavaScript, the alert() method is used to display an alert dialog box with a message to the user. This dialog box contains an OK button that the user can click to dismiss the dialog box.The alert() method is useful for displaying important messages or warnings to the user, but it should be used sparingly as it can be annoying to users if overused.
**Here's an example of how to use alert():**
``` javascript
alert("Hello, world!");
```
In this example, the alert() method is used to display a message box with the string value **"Hello, world!"**.
When you run this code, you will see an alert dialog box with the message **"Hello, world!"**. 
***The user must click the OK button to dismiss the dialog box***
<br>

## 3.querySelector()
   The querySelector() method in JavaScript is used to select elements from the Document Object Model (DOM). It allows you to select elements by their CSS selectors.
The querySelector() method is available on the document object, which represents the current web page. You can call this method on the document object to select an element.The querySelector() method is a powerful tool for selecting elements from the DOM in JavaScript. It allows you to manipulate the content and style of web pages dynamically.
**Here is an example:**
``` javascript
const myElement = document.querySelector('#myId');
```
In this example, the querySelector() method is used to select an element with the id of myId. 
***The selected element is then assigned to a variable called myElement.***

<br>

## 4.addEventListener()
The addEventListener() method is a built-in method in JavaScript that allows you to register a function to be executed whenever a specific event occurs on a specified element in the Document Object Model (DOM). 
           The syntax for the addEventListener() method is as follows:
>element.addEventListener(event, function, useCapture);

Here, element refers to the DOM element on which you want to attach the event listener. event is a string that specifies the name of the event for which the listener is being registered, such as "click", "mousemove", "keydown", etc. function is the function that should be executed when the event occurs. And useCapture is an optional boolean value that specifies whether the event should be captured during the event propagation phase.
     When an event occurs on the specified element, the function registered with addEventListener() is executed. This function is commonly known as the event handler. The event handler can be defined either as a separate function or as an anonymous function.
    Here is an example of using the addEventListener() method to attach a click event listener to a button element:
``` HTML
<button id="myButton">Click me</button>

    Javascript
    const button = document.getElementById("myButton");
    button.addEventListener("click", function() {
    alert("Button clicked!");
});
```
 In this example, we first get a reference to the button element using the getElementById() method. We then call the addEventListener() method on the button and pass in the "click" event, followed by an anonymous function that displays an alert message when the button is clicked.
    ***Overall, the addEventListener() method is a powerful tool for adding interactivity to your web pages by allowing you to respond to user actions and other events in real-time.***

<br>

## 5.setTimeout()

  The setTimeout() method is a built-in function in JavaScript that allows you to execute a specified function or piece of code after a specified amount of time has elapsed.
**The syntax for the setTimeout() method is as follows:**
>    setTimeout(function, delay, arg1, arg2, ...);

Here, function is the function that you want to execute after the delay has elapsed. delay is the number of milliseconds that you want to wait before executing the function. arg1, arg2, etc. are optional arguments that you can pass to the function.

*** When the setTimeout() method is called, it starts a timer and waits for the specified amount of time to elapse. Once the time has passed, the function specified in the first argument is executed. If additional arguments are provided, they will be passed as parameters to the function.***

  ** Here is an example of using the setTimeout() method to delay the execution of a function:**
``` javascript    
function sayHello() {
  console.log("Hello, world!");
    }
  setTimeout(sayHello, 3000);
```
***In this example, the sayHello() function is defined to log a message to the console. We then call the setTimeout() method and pass in the sayHello() function as the first argument, followed by a delay of 3000 milliseconds (3 seconds). This means that the function will not be executed until 3 seconds have passed.***
***Overall, the setTimeout() method is a useful tool for adding timed events and animations to your web pages. It allows you to create dynamic content and respond to user interactions in real-time, making your web pages more engaging and interactive.***

<br>

## 6.setInterval()
  The setInterval() method is a built-in function in JavaScript that allows you to repeatedly execute a specified function or piece of code at a set interval.

**The syntax for the setInterval() method is as follows:**
>   setInterval(function, delay, arg1, arg2, ...);

**Here, function is the function that you want to execute at each interval. delay is the number of milliseconds between each execution of the function. arg1, arg2, etc. are optional arguments that you can pass to the function.**

***When the setInterval() method is called, it starts a timer and executes the specified function at the interval specified by the delay parameter. If additional arguments are provided, they will be passed as parameters to the function.***

**Here is an example of using the setInterval() method to repeatedly execute a function at a set interval:**
``` javascript
   function sayHello() {
  console.log("Hello, world!");
  }
  setInterval(sayHello, 1000);
```
In this example, the sayHello() function is defined to log a message to the console. We then call the setInterval() method and pass in the sayHello() function as the first argument, followed by a delay of 1000 milliseconds (1 second). This means that the function will be executed once every second.

***Overall, the setInterval() method is a useful tool for creating timed events and animations on your web pages. It allows you to repeatedly execute a function or piece of code at a set interval, making your web pages more dynamic and interactive. However, it's important to be mindful of the performance impact of using setInterval(), especially if the interval is very short or the function being executed is complex.***

<br>

## 7.parseInt() 
 The parseInt() method is a built-in function in JavaScript that allows you to parse a string and convert it into an integer number.

**The syntax for the parseInt() method is as follows:**
>     parseInt(string, radix);

Here, string is the string that you want to convert into an integer, and radix is an optional parameter that specifies the base of the number system to be used for the conversion. The radix parameter can be any integer between 2 and 36, but if it's not specified, the default value is 10.

When the parseInt() method is called, it attempts to convert the specified string into an integer number. If the string contains non-numeric characters, the method will stop parsing and return the integer value of the characters it has already parsed. If the string begins with "0x" or "0X", it will be parsed as a hexadecimal number. Otherwise, the string is interpreted using the radix parameter.

**Here are some examples of using the parseInt() method to convert a string into an integer:**
``` javascript
const num1 = parseInt("123"); // returns 123
const num2 = parseInt("10", 2); // returns 2 (binary value of "10")
const num3 = parseInt("0xF", 16); // returns 15 (hexadecimal value of "F")
```
   In the first example, the parseInt() method is called on the string "123", which is parsed as a decimal number and returns the integer value 123. In the second example, the parseInt() method is called with a radix of 2, which means that the string "10" is interpreted as a binary number and returns the integer value 2. In the third example, the parseInt() method is called with a radix of 16, which means that the string "0xF" is interpreted as a hexadecimal number and returns the integer value 15.

***Overall, the parseInt() method is a useful tool for converting strings into integer numbers in JavaScript. It's commonly used when working with user input or when parsing data from external sources. However, it's important to be mindful of potential issues with parsing, such as unexpected results when the string contains non-numeric characters.***

<br>

## 8.parseFloat()

  The parseFloat() method is a built-in function in JavaScript that allows you to parse a string and convert it into a floating-point number.

**The syntax for the parseFloat() method is as follows:**
>       parseFloat(string);

*Here, string is the string that you want to convert into a floating-point number.*
When the parseFloat() method is called, it attempts to convert the specified string into a floating-point number. If the string contains non-numeric characters, the method will stop parsing and return the floating-point value of the characters it has already parsed. If the string begins with a decimal point, the method will interpret it as a fractional value.

**Here are some examples of using the parseFloat() method to convert a string into a floating-point number:**
``` javascript
const num1 = parseFloat("3.14"); // returns 3.14
   const num2 = parseFloat("12.5"); // returns 12.5
   const num3 = parseFloat("0.5"); // returns 0.5
   const num4 = parseFloat("123abc"); // returns 123
```

In the first three examples, the parseFloat() method is called on strings containing decimal values, which are parsed as floating-point numbers and returned as such. In the last example, the string "123abc" is not a valid floating-point number, so the parseFloat() method stops parsing at the first non-numeric character and returns the value 123.

***Overall, the parseFloat() method is a useful tool for converting strings into floating-point numbers in JavaScript. It's commonly used when working with user input or when parsing data from external sources.***

<br>

## 9.Math.random()

 The Math.random() method is a built-in function in JavaScript that returns a random floating-point number between 0 and 1 (excluding 1). The generated number is pseudorandom, meaning that it is not truly random, but rather determined by an algorithm. The algorithm used in JavaScript's Math.random() method is typically based on the current time and date, so the sequence of numbers it generates appears to be random.

**Here's an example of how to use the Math.random() method to generate a random number between 0 and 9: **
>const randomNum = Math.floor(Math.random() * 10);
console.log(randomNum); // Output: a random number between 0 and 9

In the example above, we use Math.floor() to round the result of Math.random() * 10 down to the nearest integer, which will be between 0 and 9 (inclusive).
[*Note that the numbers generated by Math.random() are not truly random and can be predictable if the seed value is known. Therefore, it is important not to rely on Math.random() for security-critical applications. Instead, use a cryptographically secure random number generator. *]

<br>

## 10.Math.round()

The Math.round() method is a built-in function in JavaScript that rounds a number to the nearest integer.

**Here's an example of how to use Math.round():**
>  const num1 = 4.5;
  const num2 = 4.2;

> console.log(Math.round(num1)); // Output: 5
 console.log(Math.round(num2)); // Output: 4

In the example above, the Math.round() method is used to round num1 to 5 and num2 to 4.

The Math.round() method uses the following rounding rule: If the decimal part of the number is less than 0.5, the method rounds the number down to the nearest integer. If the decimal part is 0.5 or greater, the method rounds the number up to the nearest integer
   console.log(Math.round(1.49)); // Output: 1
   console.log(Math.round(1.5)); // Output: 2

**In the example above, Math.round() rounds 1.49 down to 1 and 1.5 up to 2.**

[*Note that Math.round() returns a new rounded integer, it does not modify the original number*]

<br>

##  To manipulate the DOM (Document Object Model) content and CSS properties via JavaScript
You can use the following methods:

**1.getElementById()**
This method returns a reference to the element with  the specified ID. You can use it to manipulate the content and CSS
properties of the element.

**sample code:**
``` javascript
var element = document.getElementById(\"myElement\");
element.innerHTML = \"New content\"; // change content
element.style.color = \"red\"; // change CSS property
```

**2.querySelector()**:

This method returns the first element that matches the specified CSS selector. You can use it to manipulate the content and CSS properties of the element.

**sample code:**
``` javascript
var element = document.querySelector(\".myClass\");
element.innerHTML = \"New content\"; // change content
element.style.color = \"red\"; // change CSS property
```


**3.getElementsByClassName()**:
This method returns a collection of elements with the specified class name. You can use it to manipulate the content and CSS properties of the elements.

**sample code:**
``` javascript
var elements = document.getElementsByClassName(\"myClass\");
for(var i = 0; i \< elements.length; i++)
{ 
elements\[i\].innerHTML = \"New content\"; // change content 
elements\[i\].style.color = \"red\"; // change CSS property 
}
```

**4.getElementsByTagName()**:
This method returns a collection of elements with the specified tag name. You can use it to manipulate the content and CSS properties of the elements.

**sample code:**
``` javascript
var elements = document.getElementsByTagName(\"p\");
for (var i =0; i \< elements.length; i++) 
{
elements\[i\].innerHTML = \"New content\"; // change content 
elements\[i\].style.color = \"red\"; //change CSS property 
}
```


These methods allow you to select elements on the page and manipulate their content and CSS properties dynamically with JavaScript.

Here are some resources you can use to learn more about manipulating the DOM and CSS properties via JavaScript

<https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model>
<https://javascript.info/searching-elements-dom>
<https://www.w3schools.com/js/js_htmldom_elements.asp>

<br>

# ES6
JavaScript was invented by Brendan Eich in 1995, and became an ECMA standard in 1997.

ECMAScript is the official name of the language.

ECMAScript versions have been abbreviated to ES1, ES2, ES3, ES5, and ES6.

Since 2016, versions are named by year (ECMAScript 2016, 2017, 2018, 2019, 2020).

# **ECMAScript Editions**

Version|Official Name|Description
--------|-------------|-----------
ES1|ECMAScript 1 (1997)|	First edition
ES2|ECMAScript 2 (1998)|	Editorial changes
ES3|ECMAScript 3 (1999)|	Added regular expressions,try/catch,switch,do-while
ES4|ECMAScript 4	|Never released
ES5|ECMAScript 5 (2009)|Added "strict mode",JSON support,String.trim(),Array.isArray(),Array iteration methods
ES6|ECMAScript 2015|Added let and const,default parameter values,Array.find(),Array.findIndex()


## **ECMAScript 2016**

Added exponential operator (**)

Added Array.includes()


## **ECMAScript 2017**

Added string padding

Added Object.entries()

Added Object.values()

Added async functions

Added shared memory

Allows trailing commas for function parameters

## **ECMAScript 2018**

Added rest / spread properties

Added asynchronous iteration

Added Promise.finally()

Additions to RegExp

## **ECMAScript 2019**

String.trimStart()

String.trimEnd()

Array.flat()

Object.fromEntries

Optional catch binding

## **ECMAScript 2020**

The Nullish Coalescing Operator (??)

Browser Support for ES5 (2009)

Browser	Version	From Date

Chrome	23	Nov 2012

Firefox	21	May 2013

IE	9*	Mar 2011

IE / Edge	10	Sep 2012

Safari	6	Jul 2012

Opera	15	Jul 2013

Browser Support for ES5 (2009)

Browser	Version	From Date

Chrome	23	Nov 2012

Firefox	21	May 2013

IE	9*	Mar 2011

IE / Edge	10	Sep 2012

Safari	6	Jul 2012

Opera	15	Jul 2013

# **JavaScript Version Numbers**
*Old JS versions are named by numbers: ES5 (2009) and ES6 (2015).

*From 2016, versions are named by year: ECMAScript 2016, 2017, 2018, 2019, ...

# **New Features in ES2021**
``` js
Promise any():
const first = await Promise.any([prom1,prom2,prom3]);
String replaceAll()
Numeric Separators (_)
```

***Warning***:
*These features are relatively new.*

Older browsers may need an alternative code (Polyfill)

## **JavaScript String ReplaceAll()**

**ES2021 introduced the string method replaceAll():**
``` js
Example
text = text.replaceAll("Cats","Dogs");
text = text.replaceAll("cats","dogs");
```

The replaceAll() method allows you to specify a regular expression instead of a string to be replaced.

If the parameter is a regular expression, the global flag (g) must be set, otherwise a TypeError is thrown.
``` js
Example
text = text.replaceAll(/Cats/g,"Dogs");
text = text.replaceAll(/cats/g,"dogs");
```

## **JavaScript Numeric Separator (_)**
ES2021 intoduced the numeric separator (_) to make numbers more readable:
``` js
Example
const num = 1_000_000_000;	
```
 numeric separator is only for visual use.
``` js
Example
const num1 = 1_000_000_000;
const num2 = 1000000000;
(num1 === num2);
```
The numeric separator can be placed anywhere in a number:

Example
const num1 = 1_2_3_4_5;

# Microsoft Edge Legacy
Edge was the default browser for Windows 10.

It was built with Microsoft's browser engine EdgeHTML and their Chakra JavaScript engine.

The first versions of Edge (12-18), are now referred to as "Edge Legacy".

The Microsoft support for Edge Legacy ended on March 9, 2021.

Future Windows updates will replace Edge Legacy with The New Edge.

# Old Applications
Some old PCs (like in public libraries) are still using Internet Explorer.

Some legacy web applications are using Internet Explorer.

Some legacy web applications are using Internet Explorer runtime DLLs.

Some AJAX based applications are using Microsoft ActiveX components.

In order to ease the migration from Internet Explorer, Microsoft Edge offers Internet Explorer Mode, providing backward compatibility and enabling customers to continue to run legacy web applications.

# JavaScript / ECMAScript
JavaScript was invented by Brendan Eich in 1995.

It was developed for Netscape 2, and became the ECMA-262 standard in 1997.

After Netscape handed JavaScript over to ECMA, the Mozilla foundation continued to develop JavaScript for the Firefox browser. Mozilla's latest version was 1.8.5. (Identical to ES5).

Internet Explorer (IE4) was the first browser to support ECMA-262 Edition 1 (ES1).

# The ECMA Technical Committee 39
In 1996, Netscape and Brendan Eich took JavaScript to the ECMA international standards organization, and a technical committee (TC39) was created to develop the language.

ECMA-262 Edition 1 was released in June 1997.


rom ES4 to ES6
When the TC39 committee got together in Oslo in 2008, to agree on ECMAScript 4, they were divided into 2 very different camps:

The ECMAScript 3.1 Camp:
Microsoft and Yahoo who wanted an incremental upgrade from ES3.

The ECMAScript 4 Camp:
Adobe, Mozilla, Opera, and Google who wanted a massive ES4 upgrade.

# *August 13 2008, Brendan Eich wrote an email:*

*It's no secret that the JavaScript standards body, Ecma's Technical Committee 39, has been split for over a year, with some members favoring ES4, a major fourth edition to ECMA-262, and others advocating ES3.1 based on the existing ECMA-262 Edition 3 (ES3) specification. Now, I'm happy to report, the split is over.*

## *The solution was to work together:*

*ECMAScript 4 was renamed to ES5
ES5 should be an incremental upgrade of ECMAScript 3.
Features of ECMAScript 4 should be picked up in later versions.
TC39 should develop a new major release, bigger in scope than ES5.
The planned new release (ES6) was codenamed "Harmony" (Because of the split it created?). *


<br>

# **JavaScript and TypeScript**
 JavaScript and TypeScript are both programming languages used for web development, but there are some key differences between the two. Here are the main differences between JavaScript and TypeScript:

## **Type Safety**
TypeScript is a statically typed language, which means that every variable and function has a type. This allows for better code organization and easier debugging. On the other hand, JavaScript is a dynamically typed language, which means that types are checked at runtime rather than at compile time.

## **Compile Time**
TypeScript code needs to be compiled into JavaScript before it can be run, which can be seen as an additional step, but allows for better error checking at the compilation time. In contrast, JavaScript code runs directly in the browser.

## **Development Time**
With TypeScript, you can catch errors before runtime, which can save development time and prevent bugs in production. In JavaScript, errors may only appear during runtime, leading to longer debugging sessions.

## **Object-Oriented Programming**
TypeScript is designed with object-oriented programming (OOP) in mind, while JavaScript can be used with or without OOP principles.

## **Tooling** 
TypeScript has a stronger tooling ecosystem with more advanced features like code analysis, automatic refactoring, and code completion. This makes development faster and more efficient. JavaScript tools are also available, but they tend to be less advanced.

## **Learning Curve** 
While TypeScript is built on top of JavaScript, it introduces additional concepts and syntax, making it harder to learn than JavaScript.

## **Popularity**
JavaScript has been the dominant language for web development for many years, while TypeScript is a more recent addition. However, TypeScript is gaining popularity as more developers see the benefits of a statically typed language.

*conclusion, JavaScript is a dynamic language that is easier to learn and widely used, while TypeScript is a statically typed language that can improve code organization and prevent bugs at development time, but with a steeper learning curve. Which language to use ultimately depends on the specific needs and preferences of the developer and the project.*


**Example Of JavaScript to check whether the user has legal age for voting or not**
``` javascript
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
 
 **Example Of TypeScript to check whether the user has legal age for voting or not**
``` javascript
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


