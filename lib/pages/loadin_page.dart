import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Carregando...'),
            const SizedBox(height: 15),
            LinearProgressIndicator(
              backgroundColor: Colors.purple[100],
              color: Colors.deepPurple,
            )
          ],
        ),
      ),
    );
  }
}
