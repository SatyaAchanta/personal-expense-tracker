import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard.dart';
import '../../screens/dashboard.dart';
import '../../screens/expense_form.dart';
import '../../screens/expense_list.dart';

class MyMaterialScaffold extends StatelessWidget {
  const MyMaterialScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<DashboardController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: IndexedStack(
              index: controller.currentIndex,
              children: [
                const Dashboard(),
                const ExpenseList(),
                ExpenseForm(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              selectedIndex: controller.currentIndex,
              onDestinationSelected: controller.changeIndex,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.list),
                  label: 'Expenses',
                ),
                NavigationDestination(
                  icon: Icon(Icons.add),
                  label: 'Add Expense',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
