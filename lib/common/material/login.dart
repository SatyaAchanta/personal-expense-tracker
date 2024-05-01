import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/expense_app_user.dart';
import '../../services/user.dart';
import '../../utils/auth.dart';
import '../../utils/logger.dart';

class MyMaterialLogin extends StatelessWidget {
  MyMaterialLogin({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());
  final UserService _userService = Get.put(UserService());
  final AuthHelper _authHelper = AuthHelper();
  final logger = AppLogger("Login").getLogger();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.05,
                  horizontal: screenSize.width * 0.1,
                ),
                child: Text(
                  key: const Key('loginTitle'),
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
                  key: const Key('emailField'),
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
                  key: const Key('passwordField'),
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
              Obx(
                () => Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.05,
                  margin: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.01,
                    horizontal: screenSize.width * 0.05,
                  ),
                  child: CheckboxListTile(
                    key: const Key('newUserCheckbox'),
                    selectedTileColor: Color(Colors.blue.value),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      'I am new User. Register me.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: userController.getUser().isNewUser,
                    onChanged: (bool? value) {
                      print("value: $value");
                      userController.setIsNewUser(value!);
                    },
                  ),
                ),
              ),
              Obx(
                () => Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.05,
                  margin: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.025,
                    horizontal: screenSize.width * 0.1,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      userController.getUser().isNewUser
                          ? _authHelper.handleSignUp(
                              userController,
                              _userService,
                              _emailController.text,
                              _passwordController.text,
                              false,
                            )
                          : _authHelper.handleSignIn(
                              userController,
                              _emailController.text,
                              _passwordController.text,
                              false,
                            );
                    },
                    child: Text(
                      key: const Key('loginButton'),
                      userController.getUser().isNewUser ? 'Register' : 'Login',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  'OR',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: null,
                ),
                width: screenSize.width,
                height: screenSize.height * 0.05,
                margin: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                  horizontal: screenSize.width * 0.1,
                ),
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await userController.signInWithGoogle();
                  }, // Replace with your Google logo asset
                  child: Text(
                    'Sign in with Google',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
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
        ),
      ),
    );
  }
}
