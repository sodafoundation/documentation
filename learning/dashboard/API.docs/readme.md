## How do RESTful API works?

The basic function of a RESTful API is the same as browsing the internet. The client contacts the server by using the API when it requires a resource. 
API developers explain how the client should use the REST API in the server application API documentation. These are the general steps for any REST API call:

- The client sends a request to the server. The client follows the API documentation to format the request in a way that the server understands.

- The server authenticates the client and confirms that the client has the right to make that request.
- The server returns a response to the client. The response contains information that tells the client whether the request was successful. The response also includes any information that the client requested.

The REST API request and response details vary slightly depending on how the API developers design the API.

## Client Request :

RESTful APIs client requests contain the following main components:

### Unique resource identifier
- The server identifies each resource with unique resource identifiers. For REST services, the server typically performs resource identification by using a Uniform Resource Locator (URL).

- The URL specifies the path to the resource. A URL is similar to the website address that you enter into your browser to visit any webpage. The URL is also called the request endpoint and clearly specifies to the server what the client requires.

### Method
- Developers often implement RESTful APIs by using the Hypertext Transfer Protocol (HTTP). An HTTP method tells the server what it needs to do to the resource. 
- The following are four common HTTP methods:
#### GET :

Clients use GET to access resources that are located at the specified URL on the server. They can cache GET requests and send parameters in the RESTful API request to instruct the server to filter data before sending.

#### POST :

Clients use POST to send data to the server. They include the data representation with the request. Sending the same POST request multiple times has the side effect of creating the same resource multiple times.

#### PUT :

Clients use PUT to update existing resources on the server. Unlike POST, sending the same PUT request multiple times in a RESTful web service gives the same result.
## How do RESTful API works?

The basic function of a RESTful API is the same as browsing the internet. The client contacts the server by using the API when it requires a resource. 
API developers explain how the client should use the REST API in the server application API documentation. These are the general steps for any REST API call:

- The client sends a request to the server. The client follows the API documentation to format the request in a way that the server understands.

- The server authenticates the client and confirms that the client has the right to make that request.

- The server receives the request and processes it internally.

- The server returns a response to the client. The response contains information that tells the client whether the request was successful. The response also includes any information that the client requested.

The REST API request and response details vary slightly depending on how the API developers design the API.

## Client Request :

RESTful APIs client requests contain the following main components:

### Unique resource identifier
- The server identifies each resource with unique resource identifiers. For REST services, the server typically performs resource identification by using a Uniform Resource Locator (URL).

- The URL specifies the path to the resource. A URL is similar to the website address that you enter into your browser to visit any webpage. The URL is also called the request endpoint and clearly specifies to the server what the client requires.

### Method
- Developers often implement RESTful APIs by using the Hypertext Transfer Protocol (HTTP). An HTTP method tells the server what it needs to do to the resource. 
- The following are four common HTTP methods:

#### GET :

Clients use GET to access resources that are located at the specified URL on the server. They can cache GET requests and send parameters in the RESTful API request to instruct the server to filter data before sending.

#### POST :

Clients use POST to send data to the server. They include the data representation with the request. Sending the same POST request multiple times has the side effect of creating the same resource multiple times.

#### PUT :

Clients use PUT to update existing resources on the server. Unlike POST, sending the same PUT request multiple times in a RESTful web service gives the same result.

#### DELETE :

Clients use the DELETE request to remove the resource. A DELETE request can change the server state. However, if the user does not have appropriate authentication, the request fails.

![](https://www.easeout.co/images/uploads/rest.jpeg)

### HTTP headers
Request headers are the metadata exchanged between the client and server. For instance, the request header indicates the format of the request and response, provides information about request status, and so on.

#### Data :

REST API requests might include data for the POST, PUT, and other HTTP methods to work successfully.

#### Parameters :

RESTful API requests can include parameters that give the server more details about what needs to be done. The following are some different types of parameters:

- Path parameters that specify URL details.
- Query parameters that request more information about the resource.
- Cookie parameters that authenticate clients quickly.
## Authentication methods :

- Authentication is the process of verifying an identity. For example, you can prove your identity by showing an ID card or driver's license. Similarly, RESTful service clients must prove their identity to the server to establish trust.

- RESTful API has three common authentication methods:

### HTTP authentication
HTTP defines some authentication schemes that you can use directly when you are implementing REST API. The following are two of these schemes:

#### Basic authentication :

In basic authentication, the client sends the user name and password in the request header. It encodes them with base64, which is an encoding technique that converts the pair into a set of 64 characters for safe transmission.

![](https://assets.website-files.com/5ff66329429d880392f6cba2/61e7b5289894978b8941d1a0_basic%20authentication%20Preview.jpg)

#### Bearer authentication :

The term bearer authentication refers to the process of giving access control to the token bearer. The bearer token is typically an encrypted string of characters that the server generates in response to a login request. The client sends the token in the request headers to access resources.
### API keys
API keys are another option for REST API authentication. In this approach, the server assigns a unique generated value to a first-time client. Whenever the client tries to access resources, it uses the unique API key to verify itself. API keys are less secure because the client has to transmit the key, which makes it vulnerable to network theft.

### OAuth
OAuth combines passwords and tokens for highly secure login access to any system. The server first requests a password and then asks for an additional token to complete the authorization process. It can check the token at any time and also over time with a specific scope and longevity.

## Server Response :

- server response means a client sends a message in form of a HTTP Request and the server responds in the form of an HTTP Response. This technique is termed as Messaging.

- REST principles require the server response to contain the following main components:

### Status line
- The status line contains a three-digit status code that communicates request success or failure. For instance, 2XX codes indicate success, but 4XX and 5XX codes indicate errors. 3XX codes indicate URL redirection.

#### The following are some common status codes:
  * 200: Generic success response
  * 201: POST method success response
  * 400: Incorrect request that the server cannot process
  * 404: Resource not found

  ### Message body
- The response body contains the resource representation. The server selects an appropriate representation format based on what the request headers contain. 
- Clients can request information in XML or JSON formats, which define how the data is written in plain text. For example, if the client requests the name and age of a person named John, the server returns a JSON representation as follows:

    '{"name":"John", "age":30}'

### Headers
- The response also contains headers or metadata about the response.

- They give more context about the response and include information such as the server, encoding, date, and content type.
