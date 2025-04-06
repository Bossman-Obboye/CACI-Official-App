
// tools/generate_project.dart

import 'dart:io';

void main() {
  final directories = <String, String>{
    // Core Layer
    'lib/core/constants': 'This folder contains global constants such as string keys, timeout durations, error messages, and environment identifiers that are accessible throughout the application.',
    'lib/core/helpers': 'Includes shared utility functions and extensions that provide commonly used logic or formatting utilities across multiple layers.',
    'lib/core/theme': 'Defines application-wide theme configurations, including text styles, colors, and light/dark theme definitions.',

    // Data Layer
    'lib/data/datasources/local': 'Responsible for handling offline data persistence, such as reading/writing to shared preferences, local databases, or local JSON files.',
    'lib/data/datasources/remote': 'Handles network interactions including Firebase calls, REST API requests, GraphQL queries, etc.',
    'lib/data/models': 'Contains Data Transfer Objects (DTOs) which map remote/local data to domain models and vice versa.',
    'lib/data/repositories': 'Implements the domain repository interfaces by coordinating between local and remote data sources.',

    // Domain Layer
    'lib/domain/entities': 'Pure business objects or models that define the core application data without dependencies on any external frameworks.',
    'lib/domain/repositories': 'Abstract interfaces declaring the contract of data operations that must be fulfilled by the data layer.',
    'lib/domain/usecases': 'Encapsulates specific application logic (e.g., getHymnsByCategory, searchHymnsByKeyword), making the business rules reusable and testable.',
    'lib/domain/models': 'High-level application models representing structured business logic such as Hymn, Stanza, Category, and Language.',

    // Application Layer
    'lib/application/providers': 'Manages reactive state and dependency injection using providers (e.g., Riverpod, Provider, etc).',
    'lib/application/services': 'Holds custom service classes for tasks like navigation, logging, connectivity checking, analytics, etc.',

    // UI Layer
    'lib/ui/common': 'Stores globally reusable UI components such as buttons, loaders, text fields, icons, etc.',
    'lib/ui/screens': 'Contains all the full-screen views, each screen typically corresponds to a distinct app route.',
    'lib/ui/widgets': 'Composed widgets that are reused across multiple screens and are typically more complex than common UI widgets.',

    // Feature Modules
    'lib/features/auth': 'All components related to authentication and authorization including login, signup, and user session management.',
    'lib/features/hymnbook': 'Dedicated to everything hymn-related—browsing, searching, displaying stanzas, managing favorites, etc.',
    'lib/features/notifications': 'Manages push notifications and user alerts, especially using Firebase Cloud Messaging.',
    'lib/features/social': 'Social and community interactions including messaging, announcements, church groups, etc.',
    'lib/features/settings': 'UI and logic related to user preferences like appearance (theme), language, and profile updates.',

    // Configuration
    'lib/config/routes': 'Defines app navigation logic, including route names, transitions, guards, and route observers.',
    'lib/config/environment': 'Environment-specific setup such as API keys, base URLs, or Firebase configurations for dev, staging, and production builds.',
    'lib/config/constants': 'Shared constants that span multiple modules or do not logically belong to a specific layer.',

    // Entry Point
    'lib/main.dart': 'The application\'s bootstrap file where widgets binding, service initialization, and main app startup occurs.',

    // Dev Tools & Scripts
    'tools': 'Houses all scripts, CLI tooling, and code generation utilities to support development workflows.',
  };

  directories.forEach((path, doc) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('📁 Created directory: $path');
    }

    final readme = File('$path/README.md');
    readme.writeAsStringSync('# ${path.split('/').last}\n$doc\n');
    print('📝 Created README.md in: $path');
  });

  print('\n✅ Project structure and documentation generated successfully!');
}
