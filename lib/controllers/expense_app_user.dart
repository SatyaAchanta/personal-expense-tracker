import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/expense.dart';
import '../models/user.dart';

class ExpenseAppUserController extends GetxController {
  final user = ExpenseAppUser(
    id: const Uuid().v4().toString(),
    name: '',
    budgetLimit: 0.0,
    email: '',
    categories: [],
    feedbackMessage: '',
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
      name: 'Expense App User',
      budgetLimit: 2000.0,
      email: 'expense-app@flutter.com',
      categories: categories,
      feedbackMessage: '',
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

  void addFeedback(String feedback) {
    print('in addFeedback $feedback');
    user.update((val) {
      val!.feedbackMessage = feedback;
    });
  }
}
