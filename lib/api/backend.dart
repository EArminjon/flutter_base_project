import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

// HEADERS (space end bearer)
const String kAuthorization = "Authorization";
const String kBearer = "Bearer ";

/// [http.Response] or [null]
/// Null when exception (connection lost for example, timeout, network changed, ...)
class Backend {
  Backend();

  /// Post
  Future post({@required url, body, params, headers}) async {
    try {
      Uri uri = Uri.https(API_URL, url, params);
      return await http.post(uri, headers: headers, body: body);
    } catch (error) {
      print("Backend POST '/$url' error: ${error.toString()}");
      return null;
    }
  }

  /// Get
  Future get({@required url, params, headers}) async {
    try {
      Uri uri = Uri.https(API_URL, url, params);
      return await http.get(uri, headers: headers);
    } catch (error) {
      print("Backend GET '/$url' error: ${error.toString()}");
      return null;
    }
  }

  Future<http.Response> post_test() async => await post(
        url: "test",
        body: {},
        params: {},
        headers: {},
      );

  Future<http.Response> get_test() async => await get(
        url: "test",
        headers: {},
        params: {},
      );
}
