
This is a Flutter application that provides information about various cat breeds. It uses clean architecture principles to ensure separation of concerns, testability, and maintainability.

## Application Structure

The application is structured into three layers:

1. **Presentation Layer**: This layer includes the UI components (widgets) and the logic to manage the state of those widgets. It uses Riverpod for state management.

2. **Application Layer**: This layer contains the business logic of the application, also contains the value application service to conect with data layer. It defines entities, use cases, and abstract interfaces for repositories.

3. **Data Layer**: This layer handles data from various sources (like network requests). It implements the repositories defined in the domain layer.

## Functionality

The app displays a list of cat breeds fetched from a remote API. Users can scroll through the list to view more breeds. Each breed is displayed with a corresponding image and some information about the breed. Users can also search for specific breeds using the search bar at the top of the screen.

## Getting Started

To get started with this project:

1. Clone the repository
2. Run `flutter pub get` to install the necessary dependencies
3. Run `flutter run` to start the application

## Resources

For help getting started with Flutter, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.

For more information on clean architecture, check out [ResoCoder's Flutter TDD Clean Architecture Course](https://resocoder.com/flutter-clean-architecture-tdd/).
