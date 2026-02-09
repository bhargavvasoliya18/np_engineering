import 'package:equatable/equatable.dart';
import 'package:np_engineering/model/expense_model.dart';

abstract class ExpenseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  final List<Expense> expenses;

  ExpenseLoaded({required this.expenses});

  @override
  List<Object?> get props => [expenses];
}

class ExpenseError extends ExpenseState {
  final String error;

  ExpenseError({required this.error});

  @override
  List<Object?> get props => [error];
}