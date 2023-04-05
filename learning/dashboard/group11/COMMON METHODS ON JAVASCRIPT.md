## COMMON METHODS ON JAVASCRIPT
---
--
### console.log()
 In JavaScript, console.log() is a method that is used to output information to the console. The console is a tool that is built into web browsers and is used for debugging purposes.

      The console.log() method takes one or more arguments that can be any type of data, such as strings, numbers, objects, or arrays. It then prints the value of each argument to the console.This method is a powerful tool for debugging your JavaScript code and for printing information to the console during development.
      Here's an example of how to use console.log():
      let message = "Hello, world!";
      console.log(message);
     When you run this code, you will see the following output in the console:
     Hello, world!

 ### Alert()
  In JavaScript, the alert() method is used to display an alert dialog box with a message to the user. This dialog box contains an OK button that the user can click to dismiss the dialog box.The alert() method is useful for displaying important messages or warnings to the user, but it should be used sparingly as it can be annoying to users if overused.
  Here's an example of how to use alert():
    alert("Hello, world!");
  In this example, the alert() method is used to display a message box with the string value "Hello, world!".
  When you run this code, you will see an alert dialog box with the message "Hello, world!". The user must click the OK button to dismiss the dialog box

  ### QuerySelector()
  The querySelector() method in JavaScript is used to select elements from the Document Object Model (DOM). It allows you to select elements by their CSS selectors.
  The querySelector() method is available on the document object, which represents the current web page. You can call this method on the document object to select an element.The querySelector() method is a powerful tool for selecting elements from the DOM in JavaScript. It allows you to manipulate the content and style of web pages dynamically.
 Here is an example:
    const myElement = document.querySelector('#myId');
 In this example, the querySelector() method is used to select an element with the id of myId. The selected element is then assigned to a variable called myElement.

### AddEventListener()

 The addEventListener() method is a built-in method in JavaScript that allows you to register a function to be executed whenever a specific event occurs on a specified element in the Document Object Model (DOM).

The syntax for the addEventListener() method is as follows:
     element.addEventListener(event, function, useCapture);
 Here, element refers to the DOM element on which you want to attach the event listener. event is a string that specifies the name of the event for which the listener is being registered, such as "click", "mousemove", "keydown", etc. function is the function that should be executed when the event occurs. And useCapture is an optional boolean value that specifies whether the event should be captured during the event propagation phase.
     When an event occurs on the specified element, the function registered with addEventListener() is executed. This function is commonly known as the event handler. The event handler can be defined either as a separate function or as an anonymous function.
    Here is an example of using the addEventListener() method to attach a click event listener to a button element:
     HTML
    <button id="myButton">Click me</button>
    
    Javascript
    const button = document.getElementById("myButton");
    button.addEventListener("click", function() {
    alert("Button clicked!");
       });

 In this example, we first get a reference to the button element using the getElementById() method. We then call the addEventListener() method on the button and pass in the "click" event, followed by an anonymous function that displays an alert message when the button is clicked.
    
     Overall, the addEventListener() method is a powerful tool for adding interactivity to your web pages by allowing you to respond to user actions and other events in real-time.

### SetTimeout()

The setTimeout() method is a built-in function in JavaScript that allows you to execute a specified function or piece of code after a specified amount of time has elapsed.

The syntax for the setTimeout() method is as follows:
    setTimeout(function, delay, arg1, arg2, ...);

    Here, function is the function that you want to execute after the delay has elapsed. delay is the number of milliseconds that you want to wait before executing the function. arg1, arg2, etc. are optional arguments that you can pass to the function.

    When the setTimeout() method is called, it starts a timer and waits for the specified amount of time to elapse. Once the time has passed, the function specified in the first argument is executed. If additional arguments are provided, they will be passed as parameters to the function.

    Here is an example of using the setTimeout() method to delay the execution of a function:
       function sayHello()
        {
      console.log("Hello, world!");
        }
    setTimeout(sayHello, 3000);

   In this example, the sayHello() function is defined to log a message to the console. We then call the setTimeout() method and pass in the sayHello() function as the first argument, followed by a delay of 3000 milliseconds (3 seconds). This means that the function will not be executed until 3 seconds have passed.

Overall, the setTimeout() method is a useful tool for adding timed events and animations to your web pages. It allows you to create dynamic content and respond to user interactions in real-time, making your web pages more engaging and interactive.


### SetInterval()
 The setInterval() method is a built-in function in JavaScript that allows you to repeatedly execute a specified function or piece of code at a set interval.

 The syntax for the setInterval() method is as follows:
   setInterval(function, delay, arg1, arg2, ...);

  Here, function is the function that you want to execute at each interval. delay is the number of milliseconds between each execution of the function. arg1, arg2, etc. are optional arguments that you can pass to the function.

 When the setInterval() method is called, it starts a timer and executes the specified function at the interval specified by the delay parameter. If additional arguments are provided, they will be passed as parameters to the function.

 Here is an example of using the setInterval() method to repeatedly execute a function at a set interval:
   function sayHello() 
   {
   console.log("Hello, world!");
   }
  setInterval(sayHello, 1000);

In this example, the sayHello() function is defined to log a message to the console. We then call the setInterval() method and pass in the sayHello() function as the first argument, followed by a delay of 1000 milliseconds (1 second). This means that the function will be executed once every second.

Overall, the setInterval() method is a useful tool for creating timed events and animations on your web pages. It allows you to repeatedly execute a function or piece of code at a set interval, making your web pages more dynamic and interactive. However, it's important to be mindful of the performance impact of using setInterval(), especially if the interval is very short or the function being executed is complex.

### ParseInt() 
 The parseInt() method is a built-in function in JavaScript that allows you to parse a string and convert it into an integer number.

 The syntax for the parseInt() method is as follows:
     parseInt(string, radix);

 Here, string is the string that you want to convert into an integer, and radix is an optional parameter that specifies the base of the number system to be used for the conversion. The radix parameter can be any integer between 2 and 36, but if it's not specified, the default value is 10.

 When the parseInt() method is called, it attempts to convert the specified string into an integer number. If the string contains non-numeric characters, the method will stop parsing and return the integer value of the characters it has already parsed. If the string begins with "0x" or "0X", it will be parsed as a hexadecimal number. Otherwise, the string is interpreted using the radix parameter.

 Here are some examples of using the parseInt() method to convert  a string into an integer:
   const num1 = parseInt("123"); // returns 123
   const num2 = parseInt("10", 2); // returns 2 (binary value of "10")
   const num3 = parseInt("0xF", 16); // returns 15 (hexadecimal value of "F")

   In the first example, the parseInt() method is called on the string "123", which is parsed as a decimal number and returns the integer value 123. In the second example, the parseInt() method is called with a radix of 2, which means that the string "10" is interpreted as a binary number and returns the integer value 2. In the third example, the parseInt() method is called with a radix of 16, which means that the string "0xF" is interpreted as a hexadecimal number and returns the integer value 15.

Overall, the parseInt() method is a useful tool for converting strings into integer numbers in JavaScript. It's commonly used when working with user input or when parsing data from external sources. However, it's important to be mindful of potential issues with parsing, such as unexpected results when the string contains non-numeric characters.

### ParseFloat()
The parseFloat() method is a built-in function in JavaScript that allows you to parse a string and convert it into a floating-point number.

The syntax for the parseFloat() method is as follows:
       parseFloat(string);

 Here, string is the string that you want to convert into a floating-point number.

 When the parseFloat() method is called, it attempts to convert the specified string into a floating-point number. If the string contains non-numeric characters, the method will stop parsing and return the floating-point value of the characters it has already parsed. If the string begins with a decimal point, the method will interpret it as a fractional value.

 Here are some examples of using the parseFloat() method to convert a string into a floating-point number:
   const num1 = parseFloat("3.14"); // returns 3.14
   const num2 = parseFloat("12.5"); // returns 12.5
   const num3 = parseFloat("0.5"); // returns 0.5
   const num4 = parseFloat("123abc"); // returns 123

In the first three examples, the parseFloat() method is called on strings containing decimal values, which are parsed as floating-point numbers and returned as such. In the last example, the string "123abc" is not a valid floating-point number, so the parseFloat() method stops parsing at the first non-numeric character and returns the value 123.

Overall, the parseFloat() method is a useful tool for converting strings into floating-point numbers in JavaScript. It's commonly used when working with user input or when parsing data from external sources.

### Math.random()
 The Math.random() method is a built-in function in JavaScript that returns a random floating-point number between 0 and 1 (excluding 1). The generated number is pseudorandom, meaning that it is not truly random, but rather determined by an algorithm. The algorithm used in JavaScript's Math.random() method is typically based on the current time and date, so the sequence of numbers it generates appears to be random.

 Here's an example of how to use the Math.random() method to generate a random number between 0 and 9: 
 const randomNum = Math.floor(Math.random() * 10);
 console.log(randomNum); // Output: a random number between 0 and 9

 In the example above, we use Math.floor() to round the result of Math.random() * 10 down to the nearest integer, which will be between 0 and 9 (inclusive).

 Note that the numbers generated by Math.random() are not truly random and can be predictable if the seed value is known. Therefore, it is important not to rely on Math.random() for security-critical applications. Instead, use a cryptographically secure random number generator. 

 ###  Math.round()
  The Math.round() method is a built-in function in JavaScript that rounds a number to the nearest integer.

 Here's an example of how to use Math.round():
  const num1 = 4.5;
  const num2 = 4.2;

 console.log(Math.round(num1)); // Output: 5
 console.log(Math.round(num2)); // Output: 4

 In the example above, the Math.round() method is used to round num1 to 5 and num2 to 4.

 The Math.round() method uses the following rounding rule: If the decimal part of the number is less than 0.5, the method rounds the number down to the nearest integer. If the decimal part is 0.5 or greater, the method rounds the number up to the nearest integer
   console.log(Math.round(1.49)); // Output: 1
   console.log(Math.round(1.5)); // Output: 2

 In the example above, Math.round() rounds 1.49 down to 1 and 1.5 up to 2.

  Note that Math.round() returns a new rounded integer, it does not modify the original number. 
