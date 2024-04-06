import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/controllers/expense_app_user.dart';

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
          Container(
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.05,
              horizontal: screenSize.width * 0.1,
            ),
            child: Text(
              'Login',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.01,
              horizontal: screenSize.width * 0.1,
            ),
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: Theme.of(context).textTheme.bodySmall,
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                  horizontal: screenSize.width * 0.05,
                ),
                suffixIcon: const Icon(Icons.email),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.01,
              horizontal: screenSize.width * 0.1,
            ),
            child: TextField(
              obscureText: true,
              style: Theme.of(context).textTheme.bodyMedium,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: Theme.of(context).textTheme.bodySmall,
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                  horizontal: screenSize.width * 0.05,
                ),
                suffixIcon: const Icon(Icons.lock),
              ),
            ),
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
                await userController.signInUser(
                  "sample-user@mailinator.com",
                  "testing",
                );
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
        ],
      ),
    );
  }
}
