import 'dart:io';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final HttpService _singleton = HttpService._internal();

  factory HttpService() {
    return _singleton;
  }

  HttpService._internal();

  final http.Client _client = http.Client();
  final String _baseUrl = dotenv.get('BASE_URL');

  Future<http.Response> get({
    required String url,
    String params = '',
    Map<String, String>? header,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _client.get(
        _buildUri(
          url,
          params: params,
          queryParams: queryParams,
        ),
        headers: header,
      );
      return response;
    } on SocketException catch (error) {
      return _buildSocketError(error);
    } catch (error) {
      return _buildGenericError(error);
    }
  }

  Future<http.Response> post({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    try {
      headers.putIfAbsent(
        'Content-Type',
        () => 'application/json',
      );
      final response = await _client.post(
        _buildUri(url),
        headers: headers,
        body: jsonEncode(body),
      );
      return response;
    } on SocketException catch (error) {
      return _buildSocketError(error);
    } catch (error) {
      return _buildGenericError(error);
    }
  }

  Future<http.Response> delete({
    required String url,
    Map<String, dynamic>? body,
    required Map<String, String> headers,
  }) async {
    try {
      headers.putIfAbsent(
        'Content-Type',
        () => 'application/json',
      );
      final response = await _client.delete(
        _buildUri(url),
        headers: headers,
        body: jsonEncode(body),
      );
      return response;
    } on SocketException catch (error) {
      return _buildSocketError(error);
    } catch (error) {
      return _buildGenericError(error);
    }
  }

  http.Response _buildErrorResponse({
    required String msg,
    required dynamic error,
    bool isSocketException = false,
  }) {
    return http.Response(
      jsonEncode(
        {"error": msg, "detailedError": error},
      ),
      isSocketException ? 000 : 999,
    );
  }

  http.Response _buildGenericError(error) {
    return _buildErrorResponse(
      msg: 'Something went wrong. Please, try again.',
      error: 'Other Exception: $error',
    );
  }

  http.Response _buildSocketError(error) {
    return _buildErrorResponse(
      msg: 'Please, check your internet connection.',
      error: 'Socket Exception: $error',
      isSocketException: true,
    );
  }

  Uri _buildUri(
    String url, {
    String? params,
    Map<String, dynamic>? queryParams,
    bool customUrl = false,
  }) {
    String finalUrl = url;
    if (params != null && params.isNotEmpty) {
      finalUrl = '$finalUrl?$params';
    }
    if (!customUrl) {
      finalUrl = '$_baseUrl$finalUrl';
    }
    Uri uri = Uri.parse(finalUrl);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }
    return uri;
  }
}
