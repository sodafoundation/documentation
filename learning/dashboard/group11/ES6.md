
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
*Old JS versions are named by numbers: ES5 (2009) and ES6 (2015).*

*From 2016, versions are named by year: ECMAScript 2016, 2017, 2018, 2019, ...*

# **New Features in ES2021**
>Promise any():
const first = await Promise.any([prom1,prom2,prom3]);
String replaceAll()
Numeric Separators (_)

***Warning***:
*These features are relatively new.*

# Older browsers may need an alternative code (Polyfill)

## **JavaScript String ReplaceAll()**

**ES2021 introduced the string method replaceAll():**
>Example
text = text.replaceAll("Cats","Dogs");
text = text.replaceAll("cats","dogs");


*The replaceAll() method allows you to specify a regular expression instead of a string to be replaced.*

If the parameter is a regular expression, the global flag (g) must be set, otherwise a TypeError is thrown.
>Example
text = text.replaceAll(/Cats/g,"Dogs");
text = text.replaceAll(/cats/g,"dogs");


## **JavaScript Numeric Separator (_)**
ES2021 intoduced the numeric separator (_) to make numbers more readable:
> Example
const num = 1_000_000_000;	

 numeric separator is only for visual use.
> Example
const num1 = 1_000_000_000;
const num2 = 1000000000;
(num1 === num2);

The numeric separator can be placed anywhere in a number:
>Example
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

# J avaScript / ECMAScript
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
The planned new release (ES6) was codenamed "Harmony" (Because of the split it created?).*
