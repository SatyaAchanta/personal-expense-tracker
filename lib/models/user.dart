class ExpenseAppUser {
  String name;
  String email;
  String id;
  double budgetLimit;
  List<String> categories;
  String currency;
  List<String> feedbackMessages;

  ExpenseAppUser({
    required this.name,
    required this.email,
    required this.id,
    this.budgetLimit = 1500,
    this.categories = const [],
    this.currency = 'USD',
    this.feedbackMessages = const [],
  });
}
