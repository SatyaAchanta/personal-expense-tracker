class Expense {
  final String id;
  final String title;
  final double amount;
  final int date;
  final String description;
  final String place;
  final String category;
  final bool isFlagged;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.place,
    this.description = '',
    this.category = 'Others',
    this.isFlagged = false,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      date: json['date'],
      place: json['place'],
      description: json['description'],
      category: json['category'],
      isFlagged: json['isFlagged'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date,
      'place': place,
      'description': description,
      'category': category,
      'isFlagged': isFlagged,
    };
  }
}
