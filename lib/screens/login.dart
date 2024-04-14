import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/common/material/credentials.dart';
import 'package:personal_expense_tracker/controllers/expense_app_user.dart';
import 'package:personal_expense_tracker/screens/register.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyMaterialCredentials(
                pageTitle: 'Login',
                emailController: _emailController,
                passwordController: _passwordController,
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
                          ? await userController.signUpUser(
                              _emailController.text,
                              _passwordController.text,
                            )
                          : await userController.signInUser(
                              _emailController.text,
                              _passwordController.text,
                            );
                    },
                    child: Text(
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
                width: screenSize.width,
                height: screenSize.height * 0.05,
                margin: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                  horizontal: screenSize.width * 0.1,
                ),
                child: OutlinedButton(
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
