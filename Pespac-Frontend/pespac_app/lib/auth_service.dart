import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl =
      'https://pespac-api.onrender.com/api/auth'; // Reemplaza con la URL de tu API

  Future<http.Response> register(
      String dni,
      String dniType,
      String email,
      String password,
      String name,
      String lastName,
      String role,
      String phone) async {
    final url = Uri.parse('$apiUrl/register');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'dni': dni,
        'dniType': dniType,
        'email': email,
        'password': password,
        'name': name,
        'lastName': lastName,
        'role': role,
        'phone': phone,
      }),
    );

    if (response.statusCode == 201) {
      print(response.body);
      return response;
    } else {
      throw Exception(
          'Error en el registro: ${response.statusCode} ${response.body}');
    }
  }

  Future<http.Response> login(
    String email,
    String password,
  ) async {
    final url = Uri.parse('$apiUrl/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return response;
    } else {
      throw Exception(
          'Error en el registro: ${response.statusCode} ${response.body}');
    }
  }
}
