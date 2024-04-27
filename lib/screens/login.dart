import 'package:flutter/material.dart';
import '../common/cupertino/login.dart';
import '../common/material/login.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    print('isIos: $isIos');
    return isIos ? MyCupertinoLogin() : MyMaterialLogin();
  }
}
