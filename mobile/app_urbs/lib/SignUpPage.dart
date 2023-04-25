import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  DateTime? _data;
  String _nome = '';
  String _email = '';
  String _dataNascimento = '';
  String _telefone = '';
  String _cpf = '';
  String _senha = '';
  String _confirmarSenha = '';
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
                      _nome = value!;
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
                    _dataNascimento = value!;
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
                    _telefone = value!;
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
                    _senha = value!;
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
                    if (value != _senha) {
                      return 'As senhas não coincidem.';
                    }
                    _confirmarSenha = value!;
                    return null;
                  },
                ),
                SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // aqui você pode fazer o que quiser com os dados do formulário
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

// class _DateInputTextFieldState extends State<DateInputTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       keyboardType: TextInputType.number,
//       inputFormatters: [DateTextFormatter()],
//       onChanged: (String value) {},
//     );
//   }
// }

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
