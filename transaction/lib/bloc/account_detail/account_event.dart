import 'package:equatable/equatable.dart';
import 'package:transaction_demo/model/transaction.dart';


abstract class AccountDetailEvent extends Equatable {
  const AccountDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadAccountDetail extends AccountDetailEvent {}

class UpdateAccountDetail extends AccountDetailEvent {
  final List<AccountHolderDetail> accDetail;

  const UpdateAccountDetail(this.accDetail);

  @override
  List<Object> get props => [accDetail];
}
