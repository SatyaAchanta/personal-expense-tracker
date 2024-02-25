class User {
  String name;
  String email;
  int id;
  int budgetLimit = 0;

  User({
    required this.name,
    required this.email,
    required this.id,
    this.budgetLimit = 0,
  });
}
