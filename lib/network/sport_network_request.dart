import 'package:http/http.dart' as http;

class SportRequest {
  static Future<String?> getRequest() async {
    try {
      var url =
          "https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=aad6d65f4f8a45b9a2c17c9fbf15b3e2";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
