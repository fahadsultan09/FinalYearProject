
import 'package:manufacturer/screens/dig/Transactions.dart';

import '../screens/ProfilePage.dart';
import '../screens/main_page.dart';
import '../screens/settings_page.dart';
import '../screens/Transactions.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<MainPage>(() => MainPage());
    register<TransactionPage>(() => TransactionPage());
    register<ProfilePage>(() => ProfilePage());
    register<SettingsPage>(() => SettingsPage());
    
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
