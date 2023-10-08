
import 'package:golimo_driver/core/models/userr_response/user_data.dart';
import 'package:golimo_driver/helpers/di/di.dart';
import 'package:golimo_driver/helpers/local/cache_helper.dart';
import 'package:golimo_driver/helpers/local/enum_init.dart';
import 'package:golimo_driver/helpers/local/user_preferences/user_preferences.dart';

class UserPreferencesHelper implements IUserPreferences {
  @override
  void saveUserPreference({
    required UserData? userData,
  }) {
    di<CacheHelper>().put(
      CachingKey.userData,
      userData,
    );
  }

  @override
  UserData? getUserPreference() {
    if (di<CacheHelper>().get(
          CachingKey.userData,
        ) !=
        null) {
      return UserData.fromJson(
        di<CacheHelper>().get(
          CachingKey.userData,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  String? getUserTokenPreference() {
    String? accessToken;
    if (di<CacheHelper>().has(
      CachingKey.userData,
    )) {
      UserData model = UserData.fromJson(
        di<CacheHelper>().get(
          CachingKey.userData,
        ),
      );
      accessToken = model.token;
    }
    return accessToken;
  }

  @override
  void clearUserPreference() {
    di<CacheHelper>().clear(
      CachingKey.userData,
    );
  }
}
