class UserSettingsLocalStorage {
   /// The singleton pattern ensures that only one instance of this class exists
  /// throughout the application lifecycle.// 1. Private named constructor
  UserSettingsLocalStorage._privateConstructor();
  // 2. Single static instance created once
  static final _instance = UserSettingsLocalStorage._privateConstructor();
  // 3. Public factory constructor returns the single instance
  factory UserSettingsLocalStorage() => _instance;

}
