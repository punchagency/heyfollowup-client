import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class HttpClient {

  static Future<http.Response> makePostRequest({apiUrl, data, token, Map<String, String>? customHeader}) async {
    print(apiUrl);
    print(data);

    final uri = Uri.parse(apiUrl);
    final jsonString = json.encode(data);

    var headers = await _getHeaders(token: token, customHeader: customHeader);

    if (data == null) {
      return await http.post(uri, headers: headers);
    } else {
      return await http.post(uri, body: jsonString, headers: headers);
    }
  }

  static Future<http.Response> makePatchRequest({apiUrl, data, token, Map<String, String>? customHeader}) async {
    print(apiUrl);
    print(data);

    final uri = Uri.parse(apiUrl);
    final jsonString = json.encode(data);

    var headers = await _getHeaders(token: token, customHeader: customHeader);

    if (data == null) {
      return await http.patch(uri, headers: headers);
    } else {
      return await http.patch(uri, body: jsonString, headers: headers);
    }
  }

  static Future<http.Response> makeDeleteRequest({apiUrl, token}) async {
    print(apiUrl);
    final uri = Uri.parse(apiUrl);
    var headers = await _getHeaders(token: token);
    return await http.delete(uri, headers: headers);
  }

  static Future<http.Response> makePutRequest({apiUrl, data, token}) async {
    print(apiUrl);
    print(data);
    final uri = Uri.parse(apiUrl);
    final jsonString = json.encode(data);
    var headers = await _getHeaders(token: token);

    return await http.put(uri, body: jsonString, headers: headers);
  }

  static Future<http.Response> makeGetRequest({apiUrl, token}) async {
    print(apiUrl);

    var uri = Uri.parse(apiUrl);

    var headers = await _getHeaders(token: token);

    return await http.get(uri, headers: headers);
  }

  static isRequestSuccessful(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }

  static handleError(http.Response response) {
    print('error: ${response.body} - ${response.statusCode}');
    var body = jsonDecode(response.body);
    var data = body['error'] ?? 'Our system just hit a snag, kindly try again as we keep looking into it';
    print('ogaa $data');
    throw data;
  }

  static Future<Map<String, String>> _getHeaders({token, Map<String, String>? customHeader}) async {
    final deviceType = Platform.isAndroid ? 'android' : 'ios';

    Map<String, String> header = customHeader ?? {};
     header[HttpHeaders.contentTypeHeader] = 'application/json';
     header['source'] = 'app';
     header['device-type'] = deviceType;

    if (token != null) {
      header[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }

    print('headers>>$header');

    return header;
  }
}
