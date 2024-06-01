class ApiConstants {
  static const String _baseUrl = "https://apptest.dokandemo.com/wp-json/";
  static const String signUp = "wp/v2/users/register";

  static Uri url({required String api}) => Uri.parse("$_baseUrl$api");
}
