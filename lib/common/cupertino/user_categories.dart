import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../controllers/expense_app_user.dart';

class MyCupertinoUserCategories extends StatelessWidget {
  MyCupertinoUserCategories({super.key});

  final ExpenseAppUserController userController = Get.find();
  final TextEditingController categoryController = TextEditingController();

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Add Category'),
        content: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: CupertinoTextField(
                placeholder: 'Category',
                controller: categoryController,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              Get.back();
            },
          ),
          CupertinoDialogAction(
            child: const Text('Add'),
            onPressed: () {
              userController.addCategory(categoryController.text);
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          border: null,
          middle: const Text('Categories'),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              _showAlertDialog(context);
            },
            child: const Icon(
              CupertinoIcons.add,
              color: CupertinoColors.systemBlue,
            ),
          )),
      child: GetX<ExpenseAppUserController>(
        builder: (ExpenseAppUserController userController) {
          return ListView.builder(
            itemCount: userController.user.value.categories.length,
            itemBuilder: (BuildContext context, int index) {
              return CupertinoListTile(
                title: Text(
                  userController.user.value.categories[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
