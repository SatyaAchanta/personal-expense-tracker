class User {
  String name;
  String email;
  int id;
  int budgetLimit = 0;
  List<String> categories = [];

  User({
    required this.name,
    required this.email,
    required this.id,
    this.budgetLimit = 0,
    this.categories = const [],
  });
}
