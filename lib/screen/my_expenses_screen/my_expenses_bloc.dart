import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:np_engineering/model/expense_model.dart';
import 'package:np_engineering/screen/my_expenses_screen/my_expense_state.dart';
import 'package:np_engineering/screen/my_expenses_screen/my_expenses_event.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseInitial()) {
    on<LoadExpensesEvent>(_onLoadExpenses);
    on<AddExpenseEvent>(_onAddExpense);
  }

  Future<void> _onLoadExpenses(LoadExpensesEvent event, Emitter<ExpenseState> emit) async {
    emit(ExpenseLoading());

    await Future.delayed(const Duration(milliseconds: 500));

    // Mock data
    final expenses = [
      const Expense(
        title: 'Daily Forage',
        date: '12 Jan, 2024',
        amount: '\$1,252',
        status: 'Pending',
      ),
      const Expense(
        title: 'Internet Services',
        date: '15 Jan, 2024',
        amount: '\$1,252',
        status: 'Approved',
      ),
      const Expense(
        title: 'Game Expenses',
        date: '18 Jan, 2024',
        amount: '\$1,252',
        status: 'Rejected',
      ),
      const Expense(
        title: 'Team Building',
        date: '20 Jan, 2024',
        amount: '\$2,500',
        status: 'Pending',
      ),
    ];

    emit(ExpenseLoaded(expenses: expenses));
  }

  Future<void> _onAddExpense(AddExpenseEvent event, Emitter<ExpenseState> emit) async {
    if (state is ExpenseLoaded) {
      final currentState = state as ExpenseLoaded;
      final updatedExpenses = List<Expense>.from(currentState.expenses)
        ..add(event.expense);
      emit(ExpenseLoaded(expenses: updatedExpenses));
    }
  }
}