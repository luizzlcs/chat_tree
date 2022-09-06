import 'package:chat_tree/components/auth_form.dart';
import 'package:chat_tree/pages/auth_page.dart';
import 'package:chat_tree/pages/loadin_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}
