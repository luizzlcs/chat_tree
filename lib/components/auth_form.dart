import 'package:chat_tree/components/use_image_picker.dart';
import 'package:chat_tree/model/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  const AuthForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  showError(String sms) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(sms),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    if (_formData.image == null && _formData.isLogin) {
      return showError('Imagem não selcionada!');
    }

    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (_formData.isLogin)
                      UseImagePicker(onImagePicker: (_) {}),
                    SizedBox(height: 20),
                    if (_formData.isLogin)
                      TextFormField(
                        key: const ValueKey('nome'),
                        onChanged: (value) => _formData.name = value,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 5) {
                            return 'O nome precisa ter no mínimo 5 caracteres';
                          }
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Nome',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                    TextFormField(
                      key: const ValueKey('email'),
                      onChanged: (value) => _formData.email = value,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@') ||
                            !value.contains('.com')) {
                          return 'O e-mail não é válido';
                        }
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'E-mail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      key: const ValueKey('senha'),
                      onChanged: (value) => _formData.password = value,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return 'A senha deve possuir no mínimo 6 caracteres';
                        }
                      },
                      obscureText: true,
                      obscuringCharacter: "⚪",
                      textAlign: TextAlign.center,
                      cursorWidth: 8,
                      cursorColor: Colors.deepPurple[800],
                      decoration: const InputDecoration(
                        isDense: true,
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      child: Text(_formData.isLogin ? 'Cadastrar' : 'Entrar'),
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          minimumSize: Size(290, 36),
                          shadowColor: Colors.purple),
                      onPressed: () {
                        _submit();
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _formData.toggleAuthMode();
                        });
                      },
                      child: Text(_formData.isLogin
                          ? 'Já possui conta?'
                          : 'Não possui Conta?'),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
