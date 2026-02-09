import 'package:equatable/equatable.dart';
import 'package:np_engineering/model/expense_model.dart';

abstract class ExpenseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadExpensesEvent extends ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent {
  final Expense expense;

  AddExpenseEvent({required this.expense});

  @override
  List<Object?> get props => [expense];
}