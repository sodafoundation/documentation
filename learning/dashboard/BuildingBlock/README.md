#  INTRODUCTION TO HTML5!

HTML stands for *Hyper Text Markup Language. It is used to design web pages using a markup language. HTML is an abbreviation of Hypertext and Markup language. Hypertext defines the link between the web pages. **HTML 5* is the <u> fifth and current version of HTML.

## FEATURES:

- By utilising the `<audio>` and `<video>` tags, it has added new multimedia features that support both audio and video controls.

- There are new graphics elements including vector graphics and tags.

- Drag and Drop- The user can grab an object and drag it further dropping it to a new location.

- Geolocation services: These assist in determining a client's precise location.

- Utilises an offline SQL database to store data.
-   Easy DOCTYPE declaration i.e., <!doctype html>


- Supported Browsers: It is supported by all modern browsers.



## Some of removed elements from html5:


| Removed Elements                  |   Use Instead Elements |                    
|-----------------------------------|------------------------|
|` <acronym>  `                     |   `<abbr> `           |
| `<dir>`                           |` <ul>`                |
|` <font>`                          |` CSS`                 |
| `<applet>`                        |`<object>`             |



## Goals of HTML5:


- Remove plugins like Flash for functionality that are universally required. Provide native   support for media types such as audio and video.
- Remove plugins like Flash for functionality that are universally required. 
- Ensure uniformity across all devices and browsers.
- Make every effort to be as transparent as you can.
  
  
   # CSS3 Introduction

A document produced in any markup language can have its appearance, style, and format demonstrated using CSS, a language. It is used to organize and style the design of Web pages, to put it simply. The most recent version of CSS is CSS3, which replaced CSS2.
Some of the key modules of CSS3 are:

 - Box model
 - Image values and replaced content
 -  Text effects
 - Selectors
 - Backgrounds and borders
 - Animations
 - User interface (UI)
 - Multiple column layout
 - 2D/3D transformations

## Features of CSS3

### 1.Selectors
Through the implementation of selectors, the web page designer can choose on more granular levels. A checked pseudo-class is also included in selectors to design checked items like checkboxes and radio buttons

### 2.Text Layout and Effects

With CSS3, we can modify how text is justified, edit the document's spacing, and style how words are hyphenated.

### 3.First-Letter and First-Line Pseudo-Classes

CSS 3 has features that assist with drop-cap positioning and kerning (changing the space between characters to obtain a nice result) (large decorative capital letter at the starting of a paragraph).

### 4. Paged Content and Generated Media

In Paged Media, CSS 3 offers more options like page numbers and running headers  and footers. Moreover, there are features for cross-references and footnotes that can be printed with Generated Content.

### 5. A Multiple-Column Format

This feature contains parameters for the column-count, column-gap, and column- width that enable designers to present their material in many columns.



## Benefits of CSS3

 - Using CSS3, navigable components can be positioned consistently and
   precisely.
 - A web page can be easily customized because it only requires making  
   minor changes to a modular file.
 - CSS3 makes it simpler to create graphics, which makes it simple to   
   make the site appealing. It enables the viewing of online videos   
   without the need for external plug-ins.
 - CSS3 is affordable, quick, and   
   supported by the majority of browsers.
## CSS3 EXAMPLES
 - ### Web Font : 
  A Web Font is just a technique to use any font in your page, being downloaded instantly by the browser.This will be a radical departure from web design's prior use of just 10 to 15 generally accepted fonts. Yet, because only typefaces with valid licences should be used, this new function raises questions about copyright.


    @font-face  {
    font-family:  'Name of the new font';
    src:  url('https://designshack.net/fonts/font.ttf');
    }
![Example of page have been mocked up using this technique.](https://designshack.net/postimages/text_webfonts1.jpg)



 - ### USER INTERFACE :
 #### Resize 

With CSS3, you can quickly apply resizing to any element to make it cross-browser compatible.

    .ui_resizable  {
    padding:  20px;
    border:  1px  solid;
    resize:  both;
    overflow:  auto;
    }



#### Multiple Columns Using CSS3
Although CSS2 already has the ability to set an element's outline, CSS3 adds the ability to offset the outline from the element by a value you specify. It varies from a boundary in two ways:

Outlines don't occupy any columns.
Not all outlines must be rectangular.
Multi-column layout is a new module added to CSS3 that is suitably named. It lets you to select how many columns text should be divided down into and how they should appear.

    .multiplecolumns  {
    -moz-column-width:  130px;;
    -webkit-column-width:  130px;
    -moz-column-gap:  20px;
    -webkit-column-gap:  20px;
    -moz-column-rule:  1px  solid  #ddccb5;
    -webkit-column-rule:  1px  solid  #ddccb5;

   ![enter image description here](https://designshack.net/postimages/multiplecolumns.png)


### Spanning Columns

span more than one column – a heading, table or image for instance.

    enter code hereh2  {
    column-span:  all
    }
![enter image description here](https://designshack.net/postimages/multiplecolumns_heading.jpg)
  
  #  INTRODUCTION TO LSS
- Less (Leaner Style Sheets) is a dynamic preprocessor style sheet language that can be compiled into Cascading Style Sheets (CSS) and run on the client side or server side.
-   It was Designed by Alexis Sellier.

- ESS is an abbreviated `Learner Style styles`, is an opensource pre-processor language for CSS, The preprocessor is writing a code using a superset of CSS features, compiling this code to native CSS, and browser understanding CSS styles.

## FEATURES OF LSS


### 1.Variables

- Less allows variables to be defined. 
- Variables in Less are defined with an [at sign]  (@). Variable programming is done with a Colon (:).



### 2. Mixins

- Mixins allows embedding all the properties of a class into another class by including the class name as one of its property, thus behaving as a sort of constant or variable. 
- They can also behave like functions, and take arguments.



### 3.Functions and operations

- Less allows operations and functions. Operations allow addition, subtraction, division and multiplication of property values and colors, which can be used to create complex relationships between properties. 
- Functions map one-to-one with JavaScript code, allowing manipulation of values.

# SCSS


- SCSS (Sassy Cascading Style Sheets) is one of  two syntaxes available or the popular CSS preprocessor Sass (Syntactically Awesome Stylesheets).
-  It can be used to style the visual elements of a webpage, including buttons, sliders, images, color schemes, fonts, themes, and layouts. As a true superset of CSS, all valid CSS is also valid SCSS.



## FEATURES

### 1. VARIABLES

SCSS also supports variables. Variables can be used to store values that will be used throughout the stylesheet. This can be helpful when working with colors, sizes, and other values that might need to be changed frequently.


### 2. MIXINS 


In SCSS, mixins allow you to create groups of CSS declarations that can be reused throughout the stylesheet. This can be helpful when working with vendor prefixes, complex animations, and other code that might need to be used in multiple places
  
  # COMMONLY USED HTML TAGS
 *Document structure tag:*

*1.HTML tag*: It is the root of the HTML document which is used to specify that the document is HTML.

*Syntax:*

`<html> Statements... </html>`

*2.Head tag:* The head tag is used to contain all the head elements in the HTML file. It contains the title, style, meta, … etc tag.

*Syntax:*

`<head> Statements... </head>`

*3.Body tag:* It is used to define the body of an HTML document. It contains images, tables, lists, … etc.

*Syntax:*

`<body> Statements... </body>`

*4.Title tag:* It is used to define the title of an HTML document.

*Syntax:*

`<title> Statements... </title>`


  # A SIMPLE RESUME USING HTML
 ````
  <div class="resume">
  <div class="base">
    <div class="profile">
      <div class="photo">
        <!--<img src="" /> -->
        <i class="fas fa-rocket"></i>
      </div>
      <div class="info">
        <h1 class="name">JOHN</h1>
        <h2 class="job">Frontend Web Designer</h2>
      </div>
    </div>
    <div class="about">
      <h3>About Me</h3>I'm a web designer for Fiserv, specializing in web design, graphic design, and UX. Experienced with the Adobe Creative Suite, responsive design, social media management, and prototyping.
    </div>
    <div class="contact">
      <h3>Contact Me</h3>
      <div class="call"><a href="tel:123-456-7890"><i class="fas fa-phone"></i><span>phoneno-123-456-7890</span></a></div>
      <div class="address"><a href="https://goo.gl/maps/fiTBGT6Vnhy"><i class="fas fa-map-marker"></i><span>address-canada</span></a>
      </div>
     
      <div class="website"><a href="http://abc.com/" target="_blank"> <i class="fas fa-home"></i><span>website-abc.com</span></a></div>
    </div>
    <div class="follow">
      <h3>Follow Me</h3>
      <div class="box">
        <a href="https://www.facebook.com/astronaomical/" target="_blank"><i class="fab fa-facebook"></i></a>
        <a href="https://www.instagram.com/astronaomical/" target="_blank"><i class="fab fa-instagram "></i></a>
        <a href="https://www.pinterest.com/astronaomical/" target="_blank"><i class="fab fa-pinterest"></i></a>
        <a href="https://www.linkedin.com/in/naomi-weatherford-758385112/" target="_blank"><i class="fab fa-linkedin"></i></a>
        <a href="https://codepen.io/astronaomical/" target="_blank"><i class="fab fa-codepen"></i></a>
        <a href="https://www.behance.net/astronaomical" target="_blank"><i class="fab fa-behance"></i></a>
      </div>
    </div>
  </div>
  <div class="func">
    <div class="work">
      <h3><i class="fa fa-briefcase"></i>Experience</h3>
      <ul>
        <li><span>Technical Consultant -<br>Web Design,</span><small></small><small>   mar 2023 - Now</small></li>
        <li><span>Web Designer,</span><small></small><small>  Jan 2018 - Apr 2018</small></li>
        <li><span>Intern - Web Design,</span><small></small><small>  Aug 2017 - Dec 2017</small></li>
      </ul>
    </div>
    <div class="edu">
      <h3><i class="fa fa-graduation-cap"></i>Education</h3>
      <ul>
        <li><span>Bachelor of Science<br>Web Design and Development</span><small>,ABC university,</small><small>Jan. 2016 - Apr. 2018</small></li>
        <li><span>Computer Science</span><small> ,Edward Community College,</small><small>Sept. 2014 - Dec. 2015</small></li>
        <li><span>High School</span><small> ,M. Jackson High School,</small><small>Jan. 2013 - Jun. 2015</small></li>
      </ul>
    </div>
    <div class="skills-prog">
      <h3><i class="fas fa-code"></i>Programming Skills</h3>
      <ul>
        
        <li data-percent="90"><span>CSS3 & SCSS</span>
          <div class="skills-bar">
            <div class="bar"></div>
          </div>
        </li>
        <li data-percent="60"><span>JavaScript</span>
          <div class="skills-bar">
            <div class="bar"></div>
          </div>
        </li>
        <li data-percent="50"><span>jQuery</span>
          <div class="skills-bar">
            <div class="bar"></div>
          </div>
        </li>
        <li data-percent="40"><span>JSON</span>
          <div class="skills-bar">
            <div class="bar"></div>
          </div>
        </li>
        <li data-percent="55"><span>PHP</span>
          <div class="skills-bar">
            <div class="bar"></div>
          </div>
        </li>
        <li data-percent="40"><span>MySQL</span>
          <div class="skills-bar">
            <div class="bar"></div>
          </div>
        </li>
      </ul>
    </div>
    
    <div class="interests">
      <h3><i class="fas fa-star"></i>Interests</h3>
      <div class="interests-items">
        <div class="art"><i class="fas fa-palette"></i><span>Art</span></div>
        <div class="art"><i class="fas fa-book"></i><span>Books</span></div>
        <div class="movies"><i class="fas fa-film"></i><span>Movies</span></div>
        <div class="music"><i class="fas fa-headphones"></i><span>Music</span></div>
        <div class="games"><i class="fas fa-gamepad"></i><span>Games</span></div>
      </div>
    </div>
  </div>
</div>
 ````
  
  
  ###OUTPUT:


![FINAL 2](https://user-images.githubusercontent.com/123230416/227578598-e9f350b4-be7c-4e0d-870f-27631c15a15b.png)
