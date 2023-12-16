# Konnect demo

This Flutter application follows the Clean Architecture principles and utilizes the Bloc pattern for state management.
## Architecture Overview

The project follows the Clean Architecture principles, separating the app into different layers:

- **Presentation Layer**: Contains the Flutter widgets, Blocs, and UI-related logic.
- **Domain Layer**: Contains business logic and use cases.
- **Data Layer**: Manages data sources such as APIs and local databases.

## State Management

The app uses the Bloc pattern for state management. Blocs are responsible for managing the application's state and business logic.

## Service Locator

The `get_it` package is used as a service locator for dependency injection. It helps manage the app's dependencies in a clean and organized way.


## Local Json

User local json to mock data, user data layer binders for local and remote. Right now we are using local json to show data but in future if we need we just need to touch reporsitries to change to remote for using data

## API Requests

Retrofit is used for making API requests to the News API. It provides a type-safe way to interact with RESTful APIs.

## UI Data Layer

Also created ui data layer so in future if api contract or data mock change no change in ui layer just need to change mapper


## Dart Object Comparison

The `equatable` package is employed for efficient comparison of Dart objects. This is particularly useful when working with Blocs and state changes.


   
