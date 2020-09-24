import 'package:equatable/equatable.dart';
import 'package:transaction_demo/model/transaction.dart';


abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class LoadTransactions extends TransactionEvent {}

class UpdateTransactions extends TransactionEvent {
  final List<Transaction> transactionList;

  const UpdateTransactions(this.transactionList);

  @override
  List<Object> get props => [transactionList];
}
