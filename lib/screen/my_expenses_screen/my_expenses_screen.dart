import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:np_engineering/common_widget/common_widget.dart';
import 'package:np_engineering/screen/my_expenses_screen/my_expense_state.dart';
import 'package:np_engineering/screen/my_expenses_screen/my_expenses_bloc.dart';
import 'package:np_engineering/utils/responsive.dart';

/*
class MyExpensesScreen extends StatelessWidget {
  const MyExpensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomContainer(
        padding: ResponsiveUtil.getResponsivePadding(
          context,
          const EdgeInsets.all(20),
        ),
        child: CustomColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            CustomRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Expenses',
                  style: TextStyle(
                    fontSize: ResponsiveUtil.getResponsiveFontSize(context, 28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomRow(
                  children: [
                    Icon(
                      Icons.search,
                      size: ResponsiveUtil.getResponsiveFontSize(context, 24),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.filter_list,
                      size: ResponsiveUtil.getResponsiveFontSize(context, 24),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 24)),

            // Expense List
            Expanded(
              child: BlocBuilder<ExpenseBloc, ExpenseState>(
                builder: (context, state) {
                  if (state is ExpenseLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ExpenseLoaded) {
                    return ListView.builder(
                      itemCount: state.expenses.length,
                      itemBuilder: (context, index) {
                        final expense = state.expenses[index];
                        return CustomContainer(
                          margin: EdgeInsets.only(
                            bottom: ResponsiveUtil.getResponsiveHeight(context, 12),
                          ),
                          child: CustomCard(
                            padding: const EdgeInsets.all(16),
                            child: CustomRow(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomColumn(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        expense.title,
                                        style: TextStyle(
                                          fontSize: ResponsiveUtil.getResponsiveFontSize(
                                              context, 16),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        expense.date,
                                        style: TextStyle(
                                          fontSize: ResponsiveUtil.getResponsiveFontSize(
                                              context, 13),
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomColumn(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      expense.amount,
                                      style: TextStyle(
                                        fontSize: ResponsiveUtil.getResponsiveFontSize(
                                            context, 16),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    CustomContainer(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _getStatusColor(expense.status)
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        expense.status,
                                        style: TextStyle(
                                          fontSize: ResponsiveUtil.getResponsiveFontSize(
                                              context, 12),
                                          color: _getStatusColor(expense.status),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is ExpenseError) {
                    return Center(child: Text(state.error));
                  }
                  return const Center(child: Text('No expenses'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}*/

class MyExpensesScreen extends StatelessWidget {
  const MyExpensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(
      builder: (context, state) {
        if (state is ExpenseLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExpenseLoaded) {
          return CustomColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainer(
                padding: ResponsiveUtil.getResponsivePadding(context, const EdgeInsets.all(20)),
                child: CustomRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Expenses',
                      style: TextStyle(
                        fontSize: ResponsiveUtil.getResponsiveFontSize(context, 28),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomRow(
                      children: [
                        Icon(
                          Icons.search,
                          size: ResponsiveUtil.getResponsiveFontSize(context, 24),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.filter_list,
                          size: ResponsiveUtil.getResponsiveFontSize(context, 24),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Expense List - Use Expanded with ListView
              Expanded(
                child: ListView.builder(
                  padding: ResponsiveUtil.getResponsivePadding(
                    context,
                    const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  itemCount: state.expenses.length,
                  itemBuilder: (context, index) {
                    final expense = state.expenses[index];
                    return CustomContainer(
                      margin: EdgeInsets.only(
                        bottom: ResponsiveUtil.getResponsiveHeight(context, 12),
                      ),
                      child: CustomCard(
                        padding: const EdgeInsets.all(16),
                        child: CustomRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomColumn(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    expense.title,
                                    style: TextStyle(
                                      fontSize: ResponsiveUtil.getResponsiveFontSize(
                                          context, 16),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    expense.date,
                                    style: TextStyle(
                                      fontSize: ResponsiveUtil.getResponsiveFontSize(
                                          context, 13),
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomColumn(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  expense.amount,
                                  style: TextStyle(
                                    fontSize: ResponsiveUtil.getResponsiveFontSize(
                                        context, 16),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                CustomContainer(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(expense.status)
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    expense.status,
                                    style: TextStyle(
                                      fontSize: ResponsiveUtil.getResponsiveFontSize(
                                          context, 12),
                                      color: _getStatusColor(expense.status),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is ExpenseError) {
          return Center(child: Text(state.error));
        }
        return const Center(child: Text('No expenses'));
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}