import 'package:equatable/equatable.dart';

class Expense extends Equatable {
  final String title;
  final String date;
  final String amount;
  final String status;

  const Expense({
    required this.title,
    required this.date,
    required this.amount,
    required this.status,
  });

  @override
  List<Object?> get props => [title, date, amount, status];
}