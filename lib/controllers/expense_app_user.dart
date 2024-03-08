import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/user.dart';

class ExpenseAppUserController extends GetxController {
  final user = ExpenseAppUser(
    id: const Uuid().v4().toString(),
    name: '',
    budgetLimit: 1500,
    email: '',
    categories: [],
  ).obs;

  final List<String> categories = [
    'food',
    'clothing',
    'electronics',
    'home',
    'travel',
    'entertainment',
  ];

  @override
  void onInit() {
    super.onInit();
    user.value = ExpenseAppUser(
      id: const Uuid().v4().toString(),
      name: 'Satya Achanta',
      budgetLimit: 1500,
      email: 'satya-flutter@gmail.com',
      categories: categories,
    );
  }

  void addCategory(String category) {
    user.update((val) {
      val!.categories.add(category);
    });
  }

  void removeCategory(String category) {
    user.update((val) {
      val!.categories.remove(category);
    });
  }

  void updateBudgetLimit(double budgetLimit) {
    user.update((val) {
      val!.budgetLimit = budgetLimit;
    });
  }

  ExpenseAppUser getUser() {
    return user.value;
  }
}
