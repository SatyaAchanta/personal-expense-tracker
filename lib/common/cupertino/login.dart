import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/utils/screen.dart';

import '../../controllers/expense_app_user.dart';
import '../../services/user.dart';
import '../../utils/logger.dart';
import '../../utils/text.dart';

class MyCupertinoLogin extends StatelessWidget {
  MyCupertinoLogin({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());
  final UserService _userService = Get.put(UserService());
  final logger = AppLogger("Login").getLogger();

  void handleSignIn() async {
    bool authResult = await userController.signInUser(
      _emailController.text,
      _passwordController.text,
    );

    if (!authResult) {
      Get.snackbar(
        "Failed Login",
        userController.getUser().authErrorMessage,
        backgroundColor: CupertinoColors.systemRed,
        colorText: CupertinoColors.systemGrey6,
      );
    } else {
      Get.snackbar(
        "Login Successful",
        "Welcome ${userController.getUser().name}",
        backgroundColor: CupertinoColors.systemGreen,
        colorText: CupertinoColors.systemGrey6,
      );

      Get.toNamed("/home");
    }
  }

  void handleSignUp() async {
    bool authRes = await userController.signUpUser(
      _emailController.text,
      _passwordController.text,
    );

    logger.info("---- about to create user in db, auth res is $authRes");

    if (!authRes) {
      logger.severe("Unable to register new user in database");
      Get.snackbar(
          "Failed Registration", userController.getUser().authErrorMessage);
    } else {
      bool isUserCreated =
          await _userService.createUser(userController.getUser());

      if (isUserCreated) {
        Get.snackbar(
          "Registration Successful",
          "User created successfully",
          backgroundColor: CupertinoColors.systemGreen,
          colorText: CupertinoColors.systemGrey6,
        );

        Get.toNamed("/home");
      } else {
        Get.snackbar(
          "Failed Registration",
          "Please try again after sometime.",
          backgroundColor: CupertinoColors.systemRed,
          colorText: CupertinoColors.systemGrey6,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = getScreenSize(context);

    return CupertinoPageScaffold(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  bottom: screenSize.height / 50,
                ),
                child: Text(
                  'Login',
                  style: MyTextStyles.labelLargeBold,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height / 50,
                  horizontal: screenSize.width / 20,
                ),
                height: screenSize.height / 10,
                child: CupertinoTextField(
                  controller: _emailController,
                  placeholder: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  style: MyTextStyles.labelLarge,
                ),
              ),
              Container(
                height: screenSize.height / 10,
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height / 50,
                  horizontal: screenSize.width / 20,
                ),
                child: CupertinoTextField(
                  controller: _passwordController,
                  placeholder: 'Password',
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: MyTextStyles.labelLargeBold,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height / 50,
                  horizontal: screenSize.width / 20,
                ),
                child: Row(
                  children: [
                    Obx(
                      () => CupertinoCheckbox(
                        value: userController.getUser().isNewUser,
                        onChanged: (val) {
                          print("val : ${val}");
                          userController.setIsNewUser(val!);
                        },
                      ),
                    ),
                    Text(
                      'Register Me. I am a new user',
                      style: MyTextStyles.labelLarge,
                    ),
                  ],
                ),
              ),
              Obx(
                () => CupertinoButton.filled(
                  child: Text(
                    userController.getUser().isNewUser ? 'Register' : 'Login',
                    style: MyTextStyles.labelLargeBold,
                  ),
                  onPressed: () {
                    userController.getUser().isNewUser
                        ? handleSignUp()
                        : handleSignIn();
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: screenSize.height * 0.05,
                ),
                child: CupertinoButton.filled(
                  child: Text(
                    'Login With Google',
                    style: MyTextStyles.labelLargeBold,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
