// lib/features/auth/data/data_sources/auth_remote_data_source.dart
// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource(this.client);

  Future<UserModel> login(String username, String password) async {
    final response = await client.post(
      Uri.parse('http://192.168.1.123:8080/api/auth/signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print("IN");
      // ignore: avoid_print
      print(response.body);
      // ignore: avoid_print
      print(UserModel.fromJson(jsonDecode(response.body)));
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      // ignore: avoid_print
      print("IN ELSE");
      String errorMessage = 'Failed to login';
      String successMessage;
      try {
        // Try to decode the response body as JSON
        final responseBody = jsonDecode(response.body) as Map<String, dynamic>?;

        if (responseBody != null && responseBody['message'] != null) {
          successMessage = responseBody['message'];
          // ignore: avoid_print
          print(successMessage); // Print the error message from the server
        } else {
          errorMessage = 'Unexpected error occurred';
        }
      } catch (e) {
        // If JSON decoding fails, provide a more specific error message based on the status code
        if (response.statusCode == 404) {
          errorMessage = 'Login endpoint not found';
        } else if (response.statusCode == 401) {
          errorMessage = 'Unauthorized: Incorrect username or password';
        } else {
          errorMessage =
              'Failed to login: ${response.reasonPhrase ?? 'Unknown error'}';
        }
      }

      throw Exception(errorMessage);
    }
  }

  Future<UserModel> register(
    String firstname,
    String lastname,
    String username,
    String password,
    String phonenumber,
    String email,
  ) async {
    print("Starting register function");

    final Uri uri = Uri.parse('http://192.168.1.123:8080/api/auth/signup');
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, dynamic> body = {
      "username": username,
      "firstname": firstname,
      "lastname": lastname,
      "phone": phonenumber,
      "email": email,
      "password": password,
      "enabled": "true",
      "authorityID": "1"
    };

    print('Making POST request to $uri');
    print('Request headers: $headers');
    print('Request body: $body');

    try {
      final response = await client.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print("Register successful");
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        print("Register failed with status: ${response.statusCode}");
        String errorMessage = 'Failed to register';

        try {
          final responseBody =
              jsonDecode(response.body) as Map<String, dynamic>?;
          if (responseBody != null && responseBody.containsKey('message')) {
            errorMessage = responseBody['message'];
            print(errorMessage); // Print the error message from the server
          } else {
            errorMessage = 'Unexpected error occurred';
          }
        } catch (e) {
          print('Error decoding response: $e');
          if (response.statusCode == 404) {
            errorMessage = 'Register endpoint not found';
          } else if (response.statusCode == 401) {
            errorMessage = 'Unauthorized: Incorrect username or password';
          } else {
            errorMessage =
                'Failed to register: ${response.reasonPhrase ?? 'Unknown error'}';
          }
        }

        throw Exception(errorMessage);
      }
    } catch (e) {
      print('Network request failed: $e');
      throw Exception('Network request failed: $e');
    }
  }
}
