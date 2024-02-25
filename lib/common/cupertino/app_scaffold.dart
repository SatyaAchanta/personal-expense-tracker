import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard.dart';
import '../../screens/dashboard.dart';
import '../../screens/expense_form.dart';
import '../../screens/expense_list.dart';

class MyCupertinoScaffold extends StatelessWidget {
  MyCupertinoScaffold({super.key});

  final List<Widget> _pages = [
    const Dashboard(),
    const ExpenseList(),
    ExpenseForm(),
  ];

  final List<String> _titles = [
    'Home',
    'Expenses',
    'Add Expense',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<DashboardController>(
        builder: (controller) {
          return CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home_filled),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                ),
              ],
              currentIndex: controller.currentIndex,
              onTap: controller.changeIndex,
            ),
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: Text(_titles[index]),
                      backgroundColor: CupertinoColors.systemBackground,
                    ),
                    child: _pages[index],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
