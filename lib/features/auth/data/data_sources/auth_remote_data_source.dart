// lib/features/auth/data/data_sources/auth_remote_data_source.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource(this.client);

  Future<UserModel> login(String username, String password) async {
    final response = await client.post(
      Uri.parse('https://yourapi.com/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<UserModel> register(String username, String password) async {
    final response = await client.post(
      Uri.parse('https://yourapi.com/api/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register');
    }
  }
}
