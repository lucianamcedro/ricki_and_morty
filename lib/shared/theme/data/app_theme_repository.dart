import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppThemeRepository {
  String? get theme;
  void changeTheme(String theme);
}

@Injectable(as: AppThemeRepository)
class AppThemeRepositoryImp implements AppThemeRepository {
  AppThemeRepositoryImp(
    this._sharedPreferences,
  );

  final _themeKey = 'themeNameKey';
  final SharedPreferences _sharedPreferences;

  @override
  void changeTheme(String theme) {
    _sharedPreferences.setString(_themeKey, theme);
  }

  @override
  String? get theme => _getTheme();

  String? _getTheme() {
    try {
      return _sharedPreferences.getString(_themeKey);
    } catch (_) {
      return null;
    }
  }
}
