import 'dart:convert';
import 'http_client.dart';
import 'response/api_response.dart';

class ApiClient {

  static Future<ApiResponse> initialisePostRequest(
      {data,
      required String url,
      token,
      Map<String, String>? customHeader}) async {
    // if (await _networkInfo.isConnected()) {
    try {
      var response = await HttpClient.makePostRequest(
          apiUrl: url, token: token, data: data, customHeader: customHeader);
      if (HttpClient.isRequestSuccessful(response.statusCode)) {
        print('${response.body} >>> ${response.statusCode}');
        try {
          var body = jsonDecode(response.body);
          return ApiResponse(
            responseBody: body,
          );
        } catch (e) {
          return ApiResponse(
            responseBody: {},
          );
        }
      } else {
        return ApiResponse(
          responseBody: '',
          isSuccessful: false,
          message: HttpClient.handleError(response),
        );
      }
    } catch (e) {
      return ApiResponse(
        responseBody: '',
        isSuccessful: false,
        message: '$e',
        // message: 'Our system just hit a snag, kindly try again as we keep looking into it',
      );
    }
    // } else {
    //   return ApiResponse(
    //     responseBody: '',
    //     isSuccessful: false,
    //     message: 'Check your internet connection',
    //   );
    // }
  }

  static Future<ApiResponse> initialisePatchRequest(
      {data,
      required String url,
      token,
      Map<String, String>? customHeader}) async {
    // if (await _networkInfo.isConnected()) {
    try {
      var response = await HttpClient.makePatchRequest(
          apiUrl: url, token: token, data: data, customHeader: customHeader);
      if (HttpClient.isRequestSuccessful(response.statusCode)) {
        print('${response.body} >>> ${response.statusCode}');
        try {
          var body = jsonDecode(response.body);
          return ApiResponse(
            responseBody: body,
          );
        } catch (e) {
          return ApiResponse(
            responseBody: {},
          );
        }
      } else {
        return ApiResponse(
          responseBody: '',
          isSuccessful: false,
          message: HttpClient.handleError(response),
        );
      }
    } catch (e) {
      return ApiResponse(
        responseBody: '',
        isSuccessful: false,
        message: '$e',
      );
    }
    // } else {
    //   return ApiResponse(
    //     responseBody: '',
    //     isSuccessful: false,
    //     message: 'Check your internet connection',
    //   );
    // }
  }

  static Future<ApiResponse> initialiseDeleteRequest(
      {data, required String url, token}) async {
    // if (await _networkInfo.isConnected()) {
    try {
      var response =
          await HttpClient.makeDeleteRequest(apiUrl: url, token: token);
      if (HttpClient.isRequestSuccessful(response.statusCode)) {
        var body = jsonDecode(response.body);
        return ApiResponse(
          responseBody: body,
        );
      } else {
        return ApiResponse(
          responseBody: '',
          isSuccessful: false,
          message: HttpClient.handleError(response),
        );
      }
    } catch (e) {
      return ApiResponse(
        responseBody: '',
        isSuccessful: false,
        message: '$e',
      );
    }
    // } else {
    //   return ApiResponse(
    //     responseBody: '',
    //     isSuccessful: false,
    //     message: 'Check your internet connection',
    //   );
    // }
  }

  static Future<ApiResponse> initialiseGetRequest(
      {data, required String url, token}) async {
    // if (await _networkInfo.isConnected()) {
    try {
      var response = await HttpClient.makeGetRequest(apiUrl: url, token: token);

      if (HttpClient.isRequestSuccessful(response.statusCode)) {
        var body = jsonDecode(response.body);
        return ApiResponse(
          responseBody: body,
        );
      } else {
        return ApiResponse(
          responseBody: '',
          isSuccessful: false,
          message: HttpClient.handleError(response),
        );
      }
    } catch (e) {
      return ApiResponse(
        responseBody: '',
        isSuccessful: false,
        message: '$e',
      );
    }
  }

  static Future<ApiResponse> initialisePutRequest(
      {Map<String, dynamic>? data, required String url, token}) async {
    // if (await _networkInfo.isConnected()) {
    try {
      var response = await HttpClient.makePutRequest(
          apiUrl: url, data: data, token: token);
      if (HttpClient.isRequestSuccessful(response.statusCode)) {
        var body = jsonDecode(response.body);
        return ApiResponse(
          responseBody: body,
        );
      } else {
        return ApiResponse(
          responseBody: '',
          isSuccessful: false,
          message: HttpClient.handleError(response),
        );
      }
    } catch (e) {
      return ApiResponse(
        responseBody: '',
        isSuccessful: false,
        message: '$e',
      );
    }
    // } else {
    //   return ApiResponse(
    //     responseBody: '',
    //     isSuccessful: false,
    //     message: 'Check your internet connection',
    //   );
    // }
  }
}
