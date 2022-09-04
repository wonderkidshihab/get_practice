import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager extends GetxService {
  late SharedPreferences _sharedPreferences;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  setName(String name) {
    _sharedPreferences.setString('name', name);
  }

  String getName() {
    return _sharedPreferences.getString('name') ?? '';
  }

  setToken(String token) {
    _sharedPreferences.setString('token', token);
  }

  String getToken() {
    return _sharedPreferences.getString('token') ?? '';
  }

  setUserId(String userId) {
    _sharedPreferences.setString('userId', userId);
  }

  String getUserId() {
    return _sharedPreferences.getString('userId') ?? '';
  }

  setLoggedIn(bool isLoggedIn) {
    _sharedPreferences.setBool('isLoggedIn', isLoggedIn);
  }

  bool isLoggedIn() {
    return _sharedPreferences.getBool('isLoggedIn') ?? false;
  }

  setEmail(String email) {
    _sharedPreferences.setString('email', email);
  }

  String getEmail() {
    return _sharedPreferences.getString('email') ?? '';
  }
}
