import 'package:equatable/equatable.dart';
import 'package:transaction_demo/model/transaction.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionsLoadInProgress extends TransactionState {}

//TransactionLoadSuccess
class TransactionLoadSuccess extends TransactionState {
  final List<Transaction> transactions;

  const TransactionLoadSuccess([this.transactions = const []]);

  @override
  List<Object> get props => [transactions];
}

class TransactionsLoadFailure extends TransactionState {}
