# **What is Markdown ?**

You might be wondering, what the heck is Markdown anyway?
Markdown is a lightweight markup language. It allows you to style a digital text document using typical formatting techniques: for example, headings, emphasis, lists, images, and links. Markdown files are stored as .md or .markdown. Also, Markdown can be optionally converted into XHTML or HTML to display nicely in a browser.

Some of the many uses of Markdown are readme files, writing messages in online discussion forums, creating rich text using a plain text editor, emails, and technical documentation. Popular sites that use Markdown include GitHub, Trello, Reddit, SourceForge, and StackExchange, among many others.

You, too, may want to use Markdown for formatting your documentation. It can be hosted by Static Site Generators such as Hugo which are linked with a text editor, or you can use an end-to-end proprietary solution to produce your Markdown files.

This light-weight markup language is a compromise between restrictive WYSIWYG editors, and formatting content directly in HTML. Writers can have as much control over the presentation of their information without resorting to full HTML tagging. At the same time, Markdown parsers also support dropping in blocks of HTML code that add to Markdown’s limited syntax, in case you want to achieve a more complex design.

## **What is Markdown Language ?**

Markdown is a lightweight markup language that you can use to add formatting elements to plain text text documents. Created by John Gruber in 2004, Markdown is now one of the world’s most popular markup languages.

Using Markdown is not excalty different than using a HTML. In an application like Microsoft Word, you click buttons to format words and phrases, and the changes are visible immediately. Markdown isn’t like that. When you create a Markdown-formatted file, you add Markdown syntax to the text to indicate which words and phrases should look different.

![Markdown Logo](https://th.bing.com/th/id/OIP.8LEc7kGIdbNd9IIbND-PYwE-DE?pid=ImgDet&rs=1)

For example, to denote a heading, you add a number sign before it (e.g., # Heading One). Or to make a phrase bold, you add two asterisks before and after it (e.g., **this text is bold**). It may take a while to get used to seeing Markdown syntax in your text, especially if you’re accustomed to HTML.

## **What is it used for ?**

Markdown is an easy-to-use markup language that is used with plain text to add formatting elements (headings, bulleted lists, URLs) to plain text without the use of a formal text editor or the use of HTML tags. Markdown is device agnostic and displays the writing format consistently across device types.

Markdown is a text-to-HTML conversion tool for web writers. Markdown allows you to write using an easy-to-read, easy-to-write plain text format, then convert it to structurally valid XHTML (or HTML).

Markdown can be used for everything. People use it to create websites, documents, notes, books, presentations, email messages, and technical documentation. Markdown is portable. Files containing Markdown-formatted text can be opened using virtually any application.

## **How to use Markdown to write a Documentation?**

With Markdown, you write text in a plain text editor (such as vi or Emacs), inserting special characters to create headers, boldface, bullets, and so on. For example, the following example shows a simple technical document formatted with Markdown: ## bash and ksh **bash** closely resembles an older shell named **ksh**.

Adobe technical documentation articles are written in a lightweight markup language called Markdown, which is both easy to read and easy to learn.

As we are storing Adobe Docs content in GitHub, it can use a version of Markdown called GitHub Flavored Markdown (GFM), which provides additional functionality for common formatting needs. Additionally, Adobe extended Markdown in a few ways to support certain help-related features such as notes, tips, and embedded videos.

### **Markdown Basics**

The following sections describe the basics of authoring in Markdown.

### **Headings**

To create a heading, use a hash mark (#) at the beginning of a line:

![Headings](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/Screenshot%202023-03-25%20193817.png?raw=true)

### **Basic Texts**

A paragraph requires no special syntax in Markdown.

To format text as bold, you enclose it in two asterisks. To format text as italic, you enclose it in a single asterisk:

![Basic Text](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/Basic%20Text.png?raw=true)

To ignore Markdown formatting characters, use \ before the character:

![Ignore](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/ignore.png?raw=true)

### **Paragraphs**

When writing your Markdown body text, you’ll likely want to split your information up into paragraphs (with a noticeable gap between each paragraph).

Paragraphs are divided by a blank line (a line containing no characters) between consecutive paragraphs.

### **Line Break**

Sometimes, you’ll want to split your information up by inserting a new line, with less space than you’d get from formatting as a paragraph. This is called a line break.

To insert a line break into your Markdown file, finish your line with at least two spaces and press return. This will render a new line for your text.

### **Numbered lists and Bulleted lists**

To create numbered lists, begin a line with 1. or 1, but don’t use both formats within the same list. You don’t need to specify the numbers. GitHub does that for you.

![list](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/list%20.png?raw=true)

To create bullet lists, begin a line with * or - or +, but don’t mix the formats within the same list. (Do not mix bullet formats, such as * and +, within the same document.)

![List 2](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/List%202.png?raw=true)

### **Images**

A picture is worth a thousand words, as they say. Inserting an image into your Markdown file is similar to the formatting for links.

Begin your image formatting with an exclamation mark. Next, use square brackets to wrap your image alt text, next to parentheses containing the URL for your image. Ensure there are no spaces between the exclamation mark, square brackets, or parentheses.

Your text will look like this:

![Img](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/img.png?raw=true)

When your Markdown file is rendered to HTML, the image will be embedded directly into the body text.

### **Blockquotes**

Sometimes in Markdown, we will want to reference an external source using quotation marks. This is called a blockquote. You represent any blockquote by preceding the first line of the block quote with a greater-than sign or angle bracket (>). Gruber recommends inserting the angle bracket before every line of your blockquote.

### **Tables**

Tables are not part of the core Markdown specification, but Adobe supports them to an extent. Markdown doesn’t support multiple lines lists in cells. Best practice is to avoid using multiple lines in tables. You can create tables by using the pipe (|) character to delineate columns and rows. Hyphens create each column’s header, while pipes separate each column. Include a blank line before your table so it’s rendered correctly.

![T1](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/T1.png?raw=true)

Displayed :

![T2](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/T2.png?raw=true)

### **Links**

The Markdown syntax for an inline link consists of the [link text] portion, which is the text that will be hyperlinked, followed by the (file-name.md) portion, which is the URL or file name that’s being linked to.

![Link](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/link1.png?raw=true)

### **Code Blocks**

Markdown supports the placement of code blocks both inline in a sentence and as a separate “fenced” block between sentences.

Use back ticks (`) to create inline code styles within a paragraph. To create a specific multi-line code block, add three back ticks (```) before and after the code block (called a “fenced code block” in Markdown and just a “code block” component in AEM). For fenced code blocks, add the code language after the first set of back ticks so that Markdown correctly highlights code syntax.

Example:

![Code Block](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/Code%20Blocks.png?raw=true)

### **Escape**

Often in Markdown, you will need to include characters in your text (for example, and asterisk) that may be part of the Markdown syntax. You need to “escape” these characters so your Markdown application doesn’t read these characters as formatting.
You escape characters in Markdown using a backslash before the character, with no space in between

Your text should look like this:

![Escape](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/Escape.png?raw=true)

### **Custom Markdown extensions**

Adobe articles use standard Markdown for most article formatting, such as paragraphs, links, lists, and headings. For richer formatting, articles can use extended Markdown features such as:

* Note blocks
* Embedded videos
* Translation tags
* Component properties, such as assigning a different heading ID to a heading and specifying an image size.
  
Use the Markdown block quote ( > ) at the beginning of every line to tie together an extended component, such as a note.

Some common Markdown elements such as headings and code blocks include extended properties. If you need to change default properties, add the parameters in french braces /{ /} after the component. Extended properties are described in context.

#### **Note Blocks**

You can choose from these types of note blocks to draw attention to specific content:

![Note Blocks](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/Note%20Blocks.png?raw=true)

### **Markdown Cheatsheets**

This Markdown cheat sheet provides a quick overview of all the Markdown syntax elements. It can’t cover every edge case, so if you need more information about any of these elements, refer to the reference guides for basic syntax and extended syntax.

### **Basic Syntax**

These are the elements outlined in John Gruber’s original design document. All Markdown applications support these elements.

![Basic Syntax](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/Basic%20Syntax.png?raw=true)

### **Extended Syntax**

These elements extend the basic syntax by adding additional features. Not all Markdown applications support these elements.

![Extended Syntax 1](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/Extended%20Syntax%201.png?raw=true)

![Extended Syntax 2](https://github.com/Ryder-37/Group-6/blob/master/learning/dashboard/group-6/Markdown%20Images/Extended%20Syntax%202.png?raw=true)

## **References**

* [Experience League](https://experienceleague.adobe.com/docs/contributor/contributor-guide/writing-essentials/markdown.html?lang=en)
  
* [Document 360](https://document360.com/blog/introductory-guide-to-markdown-for-documentation-writers/)

