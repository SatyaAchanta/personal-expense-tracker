import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard.dart';
import 'dashboard.dart';
import 'expense_form.dart';
import 'expense_list.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<DashboardController>(
        builder: (controller) {
          return Scaffold(
            body: IndexedStack(
              index: controller.currentIndex,
              children: const [
                Dashboard(),
                ExpenseList(),
                ExpenseForm(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              onTap: controller.changeIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Expenses',
                ),
                BottomNavigationBarItem(
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
