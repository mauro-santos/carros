import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String senha) async {
    var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

    final Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final Map params = {
      "username": login,
      "password": senha,
    };

    // Converter para string para utlizar o header como application/json
    String s = json.encode(params);
    print("> $s");

    var response = await http.post(url, body: s, headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);
    String nome = mapResponse["nome"];
    String email = mapResponse["email"];
    String error = mapResponse["error"];

    print("Nome: $nome");
    print("Email: $email");
    print("Error: $error");

    return true;
  }
}
