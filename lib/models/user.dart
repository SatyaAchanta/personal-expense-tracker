class ExpenseAppUser {
  String name;
  String email;
  String id;
  double budgetLimit;
  List<String> categories;
  String currency;
  String feedbackMessage;
  bool isAuth;
  bool isNewUser;
  String authErrorMessage;

  ExpenseAppUser({
    required this.name,
    required this.email,
    required this.id,
    this.budgetLimit = 2000,
    this.categories = const [],
    this.currency = 'USD',
    this.feedbackMessage = "",
    this.isAuth = false,
    this.isNewUser = false,
    this.authErrorMessage = "",
  });

  factory ExpenseAppUser.fromJson(Map<String, dynamic> json) {
    return ExpenseAppUser(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      budgetLimit: json['budgetLimit'],
      categories: List<String>.from(json['categories']),
      currency: json['currency'],
      feedbackMessage: json['feedbackMessage'],
      isAuth: json['isAuth'],
      isNewUser: json['isNewUser'],
      authErrorMessage: json['authErrorMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'budgetLimit': budgetLimit,
      'categories': categories,
      'currency': currency,
      'feedbackMessage': feedbackMessage,
      'isAuth': isAuth,
      'isNewUser': isNewUser,
      'authErrorMessage': authErrorMessage,
    };
  }
}
