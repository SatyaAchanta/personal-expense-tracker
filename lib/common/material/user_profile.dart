import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/common/material/feedback.dart';

import '../../controllers/expense_app_user.dart';
import 'user_categories.dart';

class MyMaterialUserProfile extends StatelessWidget {
  MyMaterialUserProfile({super.key});

  final TextEditingController budgetController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();
  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());

  @override
  Widget build(BuildContext context) {
    budgetController.text = userController.getUser().budgetLimit.toString();
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height / 20,
          ),
          width: screenSize.width * 0.25,
          height: screenSize.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                "https://i.pinimg.com/280x280_RS/88/67/97/88679790dc509730e92c97f8f9f5189e.jpg",
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.005,
          ),
          child: Column(
            children: [
              Text(
                userController.getUser().name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                userController.getUser().email,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.05,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
            horizontal: screenSize.width * 0.01,
          ),
          child: ListTile(
              title: Text(
                'Budget',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                userController.getUser().budgetLimit.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.edit_square,
                  size: screenSize.width * 0.05,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        'Enter your budget',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: TextField(
                        controller: budgetController,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textInputAction: TextInputAction.done,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: Text(
                            'Cancel',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        TextButton(
                          onPressed: () => {
                            userController.updateBudgetLimit(
                              double.parse(budgetController.text),
                            ),
                            Navigator.pop(context, 'OK'),
                          },
                          child: Text('OK',
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                      ],
                    ),
                  );
                },
              )),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
            horizontal: screenSize.width * 0.01,
          ),
          child: ListTile(
            title: Text(
              'Categories',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text(
              userController.getUser().categories.length.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_right,
                size: screenSize.width * 0.05,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                Get.to(
                  MyMaterialUserCategories(),
                );
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: screenSize.height * 0.01,
            horizontal: screenSize.width * 0.01,
          ),
          child: ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            subtitle: Text(
              'Feedback for Developer',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_right,
                size: screenSize.width * 0.05,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                Get.to(UserFeedbackMaterial());
              },
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.01,
          ),
          child: ListTile(
            subtitle: Text(
              'Logout',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.logout,
                size: screenSize.width * 0.05,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                print("user loggedout");
              },
            ),
          ),
        ),
      ],
    );
  }
}
