class ApiConstants {
  static const String _baseUrl = "https://apptest.dokandemo.com/wp-json/";
  static const String signUp = "wp/v2/users/register";
  static const String login = "jwt-auth/v1/token";
  static const String update = "wp/v2/users/";
  static const String profile = "wp/v2/users/me";

  static Uri url({required String api}) => Uri.parse("$_baseUrl$api");
}
