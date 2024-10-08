class HistoryData {
  final int id;
  final String date;
  final List<Transaction> history;

  HistoryData({
    required this.id,
    required this.date,
    required this.history,
  });

  // Factory constructor to create HistoryData from a Map
  factory HistoryData.fromMap(Map<String, dynamic> data) {
    return HistoryData(
      id: data['id'],
      date: data['date'],
      history: (data['history'] as List)
          .map((transaction) => Transaction.fromMap(transaction))
          .toList(),
    );
  }

  // Convert HistoryData to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'history': history.map((transaction) => transaction.toMap()).toList(),
    };
  }
}


class Transaction {
  final int id;
  final String image;
  final String time;
  final String name;
  final String phone;
  final bool status;
  final String amount;
  final String category;
  final String comment;

  Transaction({
    required this.id,
    required this.image,
    required this.time,
    required this.name,
    required this.phone,
    required this.status,
    required this.amount,
    required this.category,
    required this.comment,
  });

  // Factory constructor to create a Transaction from a Map (for JSON-like data)
  factory Transaction.fromMap(Map<String, dynamic> data) {
    return Transaction(
      id: data['id'],
      image: data['image'],
      time: data['time'],
      name: data['name'],
      phone: data['phone'],
      status: data['status'],
      amount: data['amount'],
      category: data['category'],
      comment: data['comment'] ?? '',
    );
  }

  // Convert a Transaction to a Map (for serialization)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'time': time,
      'name': name,
      'phone': phone,
      'status': status,
      'amount': amount,
      'category': category,
      'comment': comment,
    };
  }
}
