import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:np_engineering/screen/login_screen/login_bloc.dart';
import 'package:np_engineering/screen/login_screen/login_screen.dart';
import 'package:np_engineering/screen/my_expenses_screen/my_expenses_bloc.dart';
import 'package:np_engineering/screen/my_expenses_screen/my_expenses_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => ExpenseBloc()..add(LoadExpensesEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Expense Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'SF Pro',
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}