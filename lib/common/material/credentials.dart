import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/utils/screen.dart';

class MyMaterialCredentials extends StatelessWidget {
  const MyMaterialCredentials({
    super.key,
    required this.pageTitle,
    required this.emailController,
    required this.passwordController,
  });

  final String pageTitle;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.05,
            horizontal: screenSize.width * 0.1,
          ),
          child: Text(
            pageTitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
            horizontal: screenSize.width * 0.1,
          ),
          child: TextField(
            controller: emailController,
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
            controller: passwordController,
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
      ],
    );
  }
}
