import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../controllers/expense_app_user.dart';
import '../../services/user.dart';
import '../../utils/auth.dart';
import '../../utils/logger.dart';
import '../../utils/screen.dart';
import '../../utils/text.dart';

class MyCupertinoLogin extends StatelessWidget {
  MyCupertinoLogin({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());
  final UserService _userService = Get.put(UserService());
  final AuthHelper _authHelper = AuthHelper();
  final logger = AppLogger("Login").getLogger();

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
                        ? _authHelper.handleSignUp(
                            userController,
                            _userService,
                            _emailController.text,
                            _passwordController.text,
                            true,
                          )
                        : _authHelper.handleSignIn(
                            userController,
                            _emailController.text,
                            _passwordController.text,
                            true,
                          );
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
