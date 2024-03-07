import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/screens/profile.dart';

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
                Dashboard(),
                const ExpenseList(),
                ExpenseForm(),
                Profile(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              selectedIndex: controller.currentIndex,
              onDestinationSelected: controller.changeIndex,
              elevation: 1.5,
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
                NavigationDestination(
                  icon: Icon(Icons.account_box),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
