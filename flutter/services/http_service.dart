import 'dart:io';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final http.Client _client = http.Client();
  static final String _baseUrl = dotenv.get('BASE_URL');

  static Future<http.Response> get({
    required String url,
    String params = '',
    Map<String, String>? header,
  }) async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl$url?$params'),
        headers: header,
      );
      return response;
    } on SocketException catch (error) {
      return _buildSocketError(error);
    } catch (error) {
      return _buildGenericError(error);
    }
  }

  static Future<http.Response> post({
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
        Uri.parse(_baseUrl + url),
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

  static Future<http.Response> delete({
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
        Uri.parse(_baseUrl + url),
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

  static http.Response _buildSocketError(error) {
    return _buildErrorResponse(
      msg: 'Please, check your internet connection.',
      error: 'Socket Exception: $error',
      isSocketException: true,
    );
  }

  static http.Response _buildGenericError(error) {
    return _buildErrorResponse(
      msg: 'Something went wrong. Please, try again.',
      error: 'Other Exception: $error',
    );
  }

  static http.Response _buildErrorResponse({
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
}
