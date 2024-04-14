import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/common/material/credentials.dart';
import 'package:personal_expense_tracker/controllers/expense_app_user.dart';

import 'login.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ExpenseAppUserController userController = ExpenseAppUserController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyMaterialCredentials(
            pageTitle: 'Register',
            emailController: _emailController,
            passwordController: _passwordController,
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.05,
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.025,
              horizontal: screenSize.width * 0.1,
            ),
            child: ElevatedButton(
              onPressed: () async {
                await userController.signUpUser(
                  "sample-user@mailinator.com",
                  "testing",
                );
              },
              child: Text(
                'Register',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(Login());
            },
            child: Text(
              'Go back to Login',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
