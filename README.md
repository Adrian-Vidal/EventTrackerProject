# EventTrackerProject

## Overview
EventTrackerProject is a full-stack application that manages events, neighborhoods, and residents. It combines a MySQL database, Spring Boot for the backend, and Angular for the front-end user interface. Users can perform CRUD operations on the entities and interact with a dynamically updated interface that reflects real-time changes.

## REST Endpoints
### Events
| HTTP Verb | URI                  | Request Body | Response Body | Response Codes |
|-----------|----------------------|--------------|---------------|----------------|
| GET       | `/api/events`         |              | List Events   | 200 |
| GET       | `/api/events/10`      |              | Representation of _event_ `10` | 200, 404 |
| POST      | `/api/events`         | Representation of a new _event_ resource | Representation of created _event_ | 201, 400 |
| PUT       | `/api/events/10`      | Representation of a new version of _event_ `10` | Representation of updated _event_ | 200, 404, 400 |
| DELETE    | `/api/events/10`      |              | | 204, 404, 400 |

### Neighborhoods
| HTTP Verb | URI                  | Request Body | Response Body | Response Codes |
|-----------|----------------------|--------------|---------------|----------------|
| GET       | `/api/neighborhoods`         |              | List Neighborhoods   | 200 |
| GET       | `/api/neighborhoods/10`      |              | Representation of _neighborhood_ `10` | 200, 404 |
| POST      | `/api/neighborhoods`         | Representation of a new _neighborhood_ resource | Representation of created _neighborhood_ | 201, 400 |
| PUT       | `/api/neighborhoods/10`      | Representation of a new version of _neighborhood_ `10` | Representation of updated _neighborhood_ | 200, 404, 400 |
| DELETE    | `/api/neighborhoods/10`      |              | | 204, 404, 400 |

### Residents
| HTTP Verb | URI                  | Request Body | Response Body | Response Codes |
|-----------|----------------------|--------------|---------------|----------------|
| GET       | `/api/residents`         |              | List Residents   | 200 |
| GET       | `/api/residents/10`      |              | Representation of _resident_ `10` | 200, 404 |
| POST      | `/api/residents`         | Representation of a new _resident_ resource | Representation of created _resident_ | 201, 400 |
| PUT       | `/api/residents/10`      | Representation of a new version of _resident_ `10` | Representation of updated _resident_ | 200, 404, 400 |
| DELETE    | `/api/residents/10`      |              | | 204, 404, 400 |
| GET       | `/api/residents/search?firstName=Peyton`      |              | Representation of _resident_ `Peyton` | 200, 204 |

## Database Schema
https://github.com/user-attachments/assets/49219604-8e36-4cf9-b709-19fe50f20c3f


## HTML/Javascript Front End using XHR/AJAX
In the EventTrackerProject, the HTML/JavaScript front end utilizes XMLHttpRequest (XHR) and Asynchronous JavaScript and XML (AJAX) to interact with the RESTful API. This setup allows for dynamic, real-time communication between the client and server without requiring full page reloads.


## Technologies Used

* Github
* Terminal
* Eclipse STS
* Spring Boot
* Spring Data JPA
* MySQL Workbench
* Postman
* Angular

## Lessons Learned
* CRUD Operations: Implementing CRUD operations with Spring Data JPA and MySQL provided practical experience with RESTful API design and data persistence
* Exception Handling: Handling exceptions effectively in a Spring Boot application to ensure robust error management
* Integration Testing: Using Postman for testing API endpoints and ensuring that they function correctly before deployment
* Database Relationships: Managing entity relationships (e.g., one-to-many) using JPA and Hibernate, and ensuring data integrity between related entities
* API Design: Crafting clear and consistent REST API endpoints and understanding the importance of HTTP status codes in API responses
* Asynchronous Operations: Gained experience in handling asynchronous operations and ensuring smooth user interactions by leveraging XHR and AJAX techniques.
* Dynamic Data Handling: Improved skills in dynamically updating web content and managing real-time data interactions, enhancing the overall user experience of the application.
* Error Handling and Debugging: Developed strategies for managing errors and debugging asynchronous requests, contributing to more reliable and user-friendly interfaces.
