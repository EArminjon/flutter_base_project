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
  Future post({@required url, body, headers}) async {
    //headers: {kAuthorization: kBearer + credentials.accessToken},
    try {
      return await http.post("$API_URL/$url", headers: headers, body: body);
    } catch (error) {
      String dump = "Backend '/$url' error: ${error.toString()}";
      print(dump);
      return null;
    }
  }


  /// Get
  /*Future get({@required url, param, headers}) async {

  }*/

  Future<http.Response> test() async => await this.post(
        url: "test",
        body: {},
      );
}
