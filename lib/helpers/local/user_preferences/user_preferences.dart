
import 'package:golimo_driver/core/models/userr_response/user_data.dart';

abstract class IUserPreferences {
  void saveUserPreference({
    required UserData userData,
  });

  UserData? getUserPreference();

  String? getUserTokenPreference();

  void clearUserPreference();
}
