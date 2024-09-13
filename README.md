# EventTrackerProject

## Overview
EventTrackerProject is a full-stack application designed to manage events and related entities. It utilizes a MySQL database, Spring Boot for the backend, and Spring Data JPA for ORM. The application allows users to perform CRUD operations on events, neighborhoods, and residents.

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
//Picture of ERD diagram

## HTML/Javascript Front End using XHR/AJAX


## Technologies Used

* Github
* Terminal
* Eclipse STS
* Spring Boot
* Spring Data JPA
* MySQL Workbench
* Postman

## Lessons Learned
* CRUD Operations: Implementing CRUD operations with Spring Data JPA and MySQL provided practical experience with RESTful API design and data persistence
* Exception Handling: Handling exceptions effectively in a Spring Boot application to ensure robust error management
* Integration Testing: Using Postman for testing API endpoints and ensuring that they function correctly before deployment
* Database Relationships: Managing entity relationships (e.g., one-to-many) using JPA and Hibernate, and ensuring data integrity between related entities
* API Design: Crafting clear and consistent REST API endpoints and understanding the importance of HTTP status codes in API responses
