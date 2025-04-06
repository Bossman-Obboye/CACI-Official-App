// tools/generate_project.dart

import 'dart:io';

void main() {
  final directories = <String, String>{
    // ─────────────────────── Core Utilities ───────────────────────
    'lib/core/constants': 'This folder holds application-wide constant values. These are settings, keys, or fixed texts used everywhere, helping avoid repetition and making it easy to update in one place.',
    'lib/core/helpers': 'Helpers are utility functions or extensions that help with small tasks across the app, such as formatting dates or capitalizing text.',
    'lib/core/theme': 'This folder defines how the app looks — its colors, fonts, styles, and theme setup — to ensure visual consistency.',

    // ─────────────────────── App Configuration ───────────────────────
    'lib/config/routes': 'Controls how users move between screens. Think of it as the app\'s navigation map.',
    'lib/config/environment': 'Contains configuration files that change depending on where the app runs — like development, staging, or production.',
    'lib/config/constants': 'Extra fixed values used throughout the app. This can be things like screen names, app version codes, or URL endpoints.',

    // ─────────────────────── Shared Application Logic ───────────────────────
    'lib/application/providers': 'Contains app-wide state managers (e.g., Riverpod providers). This is where global logic lives — like theme switching, login status, or network monitoring.',
    'lib/application/services': 'Houses shared services like navigation, logging, or notification handlers that don’t belong to a specific module but are reused globally.',

    // ─────────────────────── Shared UI Elements ───────────────────────
    'lib/ui/common': 'Reusable design elements like buttons, modals, or form fields. These help build a consistent look throughout the app.',
    'lib/ui/widgets': 'Small building blocks of UI used across multiple screens (e.g., custom text inputs or dividers).',

    // ─────────────────────── Modular Features (Modular Monolith + Clean Architecture) ───────────────────────

    // Hymnbook Module
    'lib/modules/hymnbook/domain/entities': 'Defines what a Hymn, Stanza, or Chorus “is”. These are plain Dart classes describing the structure of the hymn content.',
    'lib/modules/hymnbook/domain/repositories': 'Describes what actions can be taken on hymn data — like fetching, saving, or searching hymns — without saying how it’s done.',
    'lib/modules/hymnbook/data/models': 'Models that map the raw data from Firebase or local DBs into structured Dart classes.',
    'lib/modules/hymnbook/data/datasources': 'Handles where the data comes from (like Firebase). This is the technical layer that talks to external systems.',
    'lib/modules/hymnbook/application/providers': 'State management and business logic for handling hymn data (such as language selection, fetching hymns).',
    'lib/modules/hymnbook/ui/screens': 'Full-screen pages in the app related to hymns, such as hymn listings or a detailed view of a specific hymn.',
    'lib/modules/hymnbook/ui/widgets': 'Reusable visual components used inside hymn screens, like a hymn display box or a chorus tag.',

    // Auth Module
    'lib/modules/auth/domain/entities': 'Describes what user-related data looks like — such as User, Credentials, or AuthToken.',
    'lib/modules/auth/domain/repositories': 'Specifies what authentication features are available: login, logout, register — but not how they’re implemented.',
    'lib/modules/auth/data/models': 'Defines how authentication data (like login response) is structured in the app.',
    'lib/modules/auth/data/datasources': 'Connects to Firebase Auth or other services to send and retrieve auth info.',
    'lib/modules/auth/application/providers': 'Manages state around authentication (e.g., is the user logged in, is loading, is error).',
    'lib/modules/auth/ui/screens': 'User interface for logging in, signing up, resetting passwords, etc.',
    'lib/modules/auth/ui/widgets': 'Input fields, buttons, and other components specific to auth-related screens.',

    // Social Module (Example Future Feature)
    'lib/modules/social/...': 'This would follow the same structure. It would include everything needed to manage chat, comments, or messaging.',

    // Notifications Module (Example Future Feature)
    'lib/modules/notifications/...': 'This would handle notification logic — fetching, displaying, and managing push messages.',

    // ─────────────────────── Main Entry Point ───────────────────────
    'lib/main.dart': 'This is the first file that runs when the app launches. It kicks off dependency setup and loads the main widget tree.',

    // ─────────────────────── Developer Tools ───────────────────────
    'tools': 'Scripts, setup files, and project generators like this one go here. These are developer-only helpers.',
  };

  directories.forEach((path, doc) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('📁 Created directory: $path');
    }

    if (!path.endsWith('.dart')) {
      final readme = File('$path/README.md');
      readme.writeAsStringSync('# ${path.split('/').last}\n$doc\n');
      print('📝 Created README.md in: $path');
    }
  });

  print('\n✅ Full project structure with detailed documentation generated successfully!');
}
