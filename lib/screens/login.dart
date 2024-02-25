import 'package:flutter/cupertino.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Login here',
            style: TextStyle(fontSize: 24),
          ),
          CupertinoButton.filled(
            child: const Text("Login"),
            onPressed: () {
              return;
            },
          )
        ],
      ),
    );
  }
}
