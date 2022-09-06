import 'package:chat_tree/components/auth_form.dart';
import 'package:chat_tree/model/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLoading = false;

  void _handledSubmit(AuthFormData formData) {
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      body: Stack(
        // alignment: Alignment.center,
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(onSubmit: _handledSubmit),
            ),
          ),
          if (isLoading)
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
