import 'dart:math';

class Expense {
  String name;
  double amount;

  Expense(this.name, this.amount);
}

void main() {
  List<String> names = [
    'Groceries',
    'Restaurant',
    'Transportation',
    'Entertainment',
    'Utilities',
    'Shopping',
    'Healthcare',
    'Education',
    'Travel',
    'Miscellaneous'
  ];

  List<Expense> expenses = [];

  Random random = Random();

  for (int i = 0; i < 20; i++) {
    String randomName = names[random.nextInt(names.length)];
    double randomAmount = random.nextDouble() * 100;

    Expense expense = Expense(randomName, randomAmount);
    expenses.add(expense);
  }

  // Print the generated expenses
  for (int i = 0; i < expenses.length; i++) {
    print(
        'Expense ${i + 1}: ${expenses[i].name} - \$${expenses[i].amount.toStringAsFixed(2)}');
  }
}
