import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  DateTime? _data;
  String _name = '';
  String _email = '';
  String _date = '';
  String _phone = '';
  String _cpf = '';
  String _password = '';
  String _confirmPassword = '';

  final _formKey = GlobalKey<FormState>();

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
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(color: Colors.white54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Por favor, informe seu nome.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.white54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, informe seu e-mail.';
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)) {
                      return 'E-mail inválido.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Data de nascimento',
                    labelStyle: TextStyle(color: Colors.white54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, informe sua data de nascimento.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _date = value!;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    DateTextFormatter(),
                    LengthLimitingTextInputFormatter(10),
                    // Inserir aqui a lógica de formatação
                  ],
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    labelStyle: TextStyle(color: Colors.white54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, informe seu telefone.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phone = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    labelStyle: TextStyle(color: Colors.white54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, informe seu CPF.';
                    }
                    if (value!.length != 11) {
                      return 'CPF inválido.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cpf = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.white54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  obscureText: true,
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, informe uma senha.';
                    }
                    if (value!.length < 8) {
                      return 'A senha deve ter no mínimo 8 caracteres.';
                    }
                    _password = value!;
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirmar senha',
                    labelStyle: TextStyle(color: Colors.white54),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, confirme sua senha.';
                    }
                    if (value != _password) {
                      return 'As senhas não coincidem.';
                    }
                    _confirmPassword = value!;
                    return null;
                  },
                ),
                SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Register register = Register(
                          username: _name,
                          password: _password,
                          email: _email,
                          date: _date,
                          phone: _phone,
                          cpf: _cpf,
                          confirmPassword: _confirmPassword);

                      try {
                        // faz uma requisição com os dados do usuário
                        final response = await http.post(
                          Uri.parse('https://exemplo.com/api/login'),
                          body: jsonEncode(<String, String>{
                            'username': register.username,
                            'email': register.email,
                            'date': register.date,
                            'phone': register.phone,
                            'password': register.password,
                            'cpf': register.cpf,
                            'confirmPassword': register.confirmPassword
                          }),
                        );

                        // verifica se a resposta foi bem sucedida
                        if (response.statusCode == 200) {
                          // faz algo com os dados de retorno
                        } else {
                          throw Exception(
                              'Erro ao efetuar cadastro: ${response.statusCode}');
                        }
                      } catch (e) {
                        throw Exception('Erro ao efetuar cadastro: $e');
                      }
                    }
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

class DateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    //this fixes backspace bug
    if (oldValue.text.length >= newValue.text.length) {
      return newValue;
    }

    var dateText = _addSeperators(newValue.text, '/');
    return newValue.copyWith(
        text: dateText, selection: updateCursorPosition(dateText));
  }

  String _addSeperators(String value, String seperator) {
    value = value.replaceAll('/', '');
    var newString = '';
    for (int i = 0; i < value.length; i++) {
      newString += value[i];
      if (i == 1) {
        newString += seperator;
      }
      if (i == 3) {
        newString += seperator;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}

class Register {
  final String username;
  final String password;
  final String email;
  final String date;
  final String phone;
  final String cpf;
  final String confirmPassword;

  Register(
      {required this.username,
      required this.password,
      required this.email,
      required this.date,
      required this.phone,
      required this.cpf,
      required this.confirmPassword});
}
