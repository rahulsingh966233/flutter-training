import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_demo/bloc/account_detail/account_block.dart';
import 'package:transaction_demo/bloc/account_detail/account_event.dart';
import 'package:transaction_demo/bloc/transaction_bloc.dart';
import 'package:transaction_demo/bloc/transaction_event.dart';
import 'package:transaction_demo/repository/transaction_repository.dart';
import 'package:transaction_demo/widget/account_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transactions Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionBloc>(
          create: (context) {
            return TransactionBloc(
              transactionRepository: TransactionRepository(),
            )..add(LoadTransactions());
          },
        ),
        BlocProvider<AccountBloc>(
          create: (context) {
            return AccountBloc(
              transactionRepository: TransactionRepository(),
            )..add(LoadAccountDetail());
          },
        ),
      ],
      child: AccountScreen(),
    );
  }
}
