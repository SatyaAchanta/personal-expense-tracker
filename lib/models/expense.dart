class Expense {
  final String id;
  final String title;
  final double amount;
  final int date;
  final String description;
  final String place;
  final String category;
  final bool isFlagged;
  final bool isFavorite;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.place,
    this.description = '',
    this.category = 'Others',
    this.isFlagged = false,
    this.isFavorite = false,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      date: json['date'],
      place: json['place'],
      description: json['description'],
      category: json['category'] ?? 'others',
      isFlagged: json['isFlagged'] ?? false,
      isFavorite: json['isFavorite'] ?? false,
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
      'isFavorite': isFavorite,
    };
  }
}
