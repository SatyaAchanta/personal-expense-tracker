import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/auth.dart';
import '../models/user.dart';
import '../services/auth.dart';
import '../utils/logger.dart';

class ExpenseAppUserController extends GetxController {
  final user = ExpenseAppUser(
    id: const Uuid().v4().toString(),
    name: '',
    budgetLimit: 2000,
    email: '',
    categories: [],
    feedbackMessage: '',
    isAuth: false,
    isNewUser: false,
  ).obs;

  final logger = AppLogger('ExpenseAppUserController').getLogger();

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

    _auth.authStateChanges().listen(
      (User? authUser) {
        logger.info("user signed in: ${authUser?.uid}");
        if (authUser == null) {
          logger.info('User is currently signed out!');
        } else {
          user.value = ExpenseAppUser(
            id: authUser.uid,
            name: authUser.displayName ?? '',
            budgetLimit: 2000.0,
            email: authUser.email ?? '',
            categories: categories,
            feedbackMessage: '',
            isAuth: true,
            isNewUser: false,
          );
        }
      },
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
    logger.info('in addFeedback $feedback');
    user.update((val) {
      val!.feedbackMessage = feedback;
    });
  }

  void setIsNewUser(bool isNewUser) {
    user.update((val) {
      val!.isNewUser = isNewUser;
    });
  }

  Future<bool> signInUser(String email, String password) async {
    Auth auth = await _authService.signInWithEmailAndPassword(email, password);
    if (auth.user != null) {
      return true;
    } else if (auth.error != null) {
      user.update((val) {
        val!.authErrorMessage = auth.error!;
      });
      return false;
    } else {
      return false;
    }
  }

  Future<bool> signUpUser(String email, String password) async {
    Auth auth = await _authService.signUpWithEmailAndPassword(email, password);
    if (auth.user != null) {
      return true;
    } else if (auth.error != null) {
      user.update((val) {
        val!.authErrorMessage = auth.error!;
      });
      return false;
    } else {
      return false;
    }
  }

  Future<User?> signInWithGoogle() async {
    User? user = await _authService.signInWithGoogle();
    this.user.update((val) {
      val!.isAuth = true;
    });
    return user;
  }

  void signOut() {
    _authService.signOut();
    user.update((val) {
      val!.isAuth = false;
    });
  }
}
