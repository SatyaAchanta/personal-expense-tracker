import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:personal_expense_tracker/services/auth.dart';
import 'package:uuid/uuid.dart';

import '../models/user.dart';

class ExpenseAppUserController extends GetxController {
  final user = ExpenseAppUser(
    id: const Uuid().v4().toString(),
    name: '',
    budgetLimit: 0.0,
    email: '',
    categories: [],
    feedbackMessage: '',
    isAuth: false,
    isNewUser: false,
  ).obs;

  final List<String> categories = [
    'food',
    'clothing',
    'electronics',
    'home',
    'travel',
    'entertainment',
  ];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authService = Get.put(AuthService());

  @override
  void onInit() {
    super.onInit();

    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Get.toNamed('/dashboard');
      }
    });

    user.value = ExpenseAppUser(
      id: const Uuid().v4().toString(),
      name: 'Expense App User',
      budgetLimit: 2000.0,
      email: 'expense-app@flutter.com',
      categories: categories,
      feedbackMessage: '',
      isAuth: false,
      isNewUser: false,
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

  void setIsNewUser(bool isNewUser) {
    user.update((val) {
      val!.isNewUser = isNewUser;
    });
  }

  Future<User?> signInUser(String email, String password) async {
    User? user = await _authService.signInWithEmailAndPassword(email, password);
    if (user != null) {
      print(user);
      this.user.update((val) {
        val!.isAuth = true;
      });
    }
    return user;
  }

  Future<User?> signUpUser(String email, String password) async {
    User? user = await _authService.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      print(user);
      this.user.update((val) {
        val!.isAuth = true;
      });
    }
    return user;
  }

  Future<User?> signInWithGoogle() async {
    User? user = await _authService.signInWithGoogle();
    print(user);
    this.user.update((val) {
      val!.isAuth = true;
    });
    return user;
  }
}
