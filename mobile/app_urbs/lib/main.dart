import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_urbs/SignUpPage.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

void main() {
  runApp(
    MaterialApp(
      home: LoginPage(),
    ),
  );
}

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _senha = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 107, 112),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: Color.fromARGB(255, 101, 107, 112),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('lib/assets/images/URBS_logo.png',
                    width: 200, height: 200),
                SizedBox(height: 100),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome de usuário',
                      labelStyle: TextStyle(color: Colors.white54),
                      prefixIcon: Icon(Icons.person, color: Colors.white54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onSaved: (value) {
                      _nome = value!;
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.white54),
                      prefixIcon: Icon(Icons.lock, color: Colors.white54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    onSaved: (value) {
                      _senha = value!;
                    },
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      User user = User(
                        username: _nome,
                        password: _senha,
                      );
                      try {
                        // faz uma requisição com os dados do usuário
                        final response = await http.post(
                          Uri.parse('https://exemplo.com/api/login'),
                          body: jsonEncode(<String, String>{
                            'username': user.username,
                            'password': user.password,
                          }),
                        );

                        // verifica se a resposta foi bem sucedida
                        if (response.statusCode == 200) {
                          // faz algo com os dados de retorno
                        } else {
                          throw Exception(
                              'Erro ao efetuar login: ${response.statusCode}');
                        }
                      } catch (e) {
                        throw Exception('Erro ao efetuar login: $e');
                      }
                    }
                  },
                  child: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50),
                    primary: Color.fromARGB(255, 234, 51, 35),
                    onPrimary: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text('Criar conta'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 234, 51, 35),
                    onPrimary: Colors.white,
                    minimumSize: Size(200, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}