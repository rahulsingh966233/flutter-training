import 'package:equatable/equatable.dart';
import 'package:transaction_demo/model/transaction.dart';

abstract class AccountDetailState extends Equatable {
  const AccountDetailState();

  @override
  List<Object> get props => [];
}

class AccountDetailLoadInProgress extends AccountDetailState {}

//TransactionLoadSuccess
class AccountDetailLoadSuccess extends AccountDetailState {
  final List<AccountHolderDetail> accDetail;

  const AccountDetailLoadSuccess(this.accDetail, );

  @override
  List<Object> get props => [accDetail];
}

class TransactionsLoadFailure extends AccountDetailState {}
