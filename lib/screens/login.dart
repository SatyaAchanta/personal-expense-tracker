import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/common/material/credentials.dart';
import 'package:personal_expense_tracker/controllers/expense_app_user.dart';
import 'package:personal_expense_tracker/screens/register.dart';

class Login extends StatelessWidget {
  Login({super.key});

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
            pageTitle: 'Login',
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
                await userController.signInUser(
                  "sample-user@mailinator.com",
                  "testing",
                );
              },
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.01,
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.05,
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.01,
              horizontal: screenSize.width * 0.1,
            ),
            child: OutlinedButton.icon(
              onPressed: () async {
                await userController.signInWithGoogle();
              },
              icon: Image.asset(
                'assets/images/google_logo.jpeg',
                height: 24.0,
              ), // Replace with your Google logo asset
              label: Text(
                'Sign in with Google',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.01,
          ),
          TextButton(
              onPressed: () {
                Get.to(Register());
              },
              child: Text(
                'New User ? Register Here',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).primaryColor,
                    ),
              )),
          TextButton(
            onPressed: null,
            child: Text(
              'Forgot Password ?',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
