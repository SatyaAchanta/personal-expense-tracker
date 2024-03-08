import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/expense_app_user.dart';

class MyMaterialUserCategories extends StatelessWidget {
  MyMaterialUserCategories({super.key});

  final ExpenseAppUserController userController =
      Get.put(ExpenseAppUserController());

  final TextEditingController categoryController = TextEditingController();

  addCategoryDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Category'),
          content: TextField(
            controller: categoryController,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            TextButton(
              onPressed: () {
                userController.addCategory(categoryController.text);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              addCategoryDialog(context);
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: userController.getUser().categories.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                userController.getUser().categories[index],
                style: Theme.of(context).textTheme.titleMedium,
              ),
              // trailing: IconButton(
              //   icon: const Icon(
              //     Icons.remove,
              //     color: Colors.redAccent,
              //   ),
              //   onPressed: () {
              //     userController.removeCategory(
              //         userController.getUser().categories[index]);
              //   },
              // ),
            );
          },
        ),
      ),
    );
  }
}
