import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/expense_app_user.dart';
import '../services/user.dart';

class AuthHelper {
  void handleSignIn(
    ExpenseAppUserController userController,
    String email,
    String password,
  ) async {
    bool authResult = await userController.signInUser(
      email,
      password,
    );

    if (!authResult) {
      Get.snackbar(
        "Failed Login",
        userController.getUser().authErrorMessage,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Login Successful",
        "Welcome ${userController.getUser().name}",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.toNamed("/home");
    }
  }

  void handleSignUp(
    ExpenseAppUserController userController,
    UserService userService,
    String email,
    String password,
  ) async {
    bool authRes = await userController.signUpUser(
      email,
      password,
    );

    // logger.info("---- about to create user in db, auth res is $authRes");

    if (!authRes) {
      // logger.severe("Unable to register new user in database");
      Get.snackbar(
          "Failed Registration", userController.getUser().authErrorMessage);
    } else {
      bool isUserCreated =
          await userService.createUser(userController.getUser());

      if (isUserCreated) {
        Get.snackbar(
          "Registration Successful",
          "User created successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.toNamed("/home");
      } else {
        Get.snackbar(
          "Failed Registration",
          "Please try again after sometime.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
