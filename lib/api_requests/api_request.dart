import 'package:http/http.dart' as http;

class ApiRequest {
  static Future getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      print("URL: $url");
      print("RESPONSE BODY: ${response.body}");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}