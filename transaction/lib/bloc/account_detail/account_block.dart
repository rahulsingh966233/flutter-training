import 'dart:async';

import 'package:transaction_demo/bloc/account_detail/account_event.dart';
import 'package:transaction_demo/bloc/account_detail/account_state.dart';
import 'package:transaction_demo/repository/transaction_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class AccountBloc extends Bloc<AccountDetailEvent, AccountDetailState> {
  final TransactionRepository transactionRepository;
  StreamSubscription _transactionSubscription;

  AccountBloc({@required this.transactionRepository})
      : super(AccountDetailLoadInProgress());

  @override
  Stream<AccountDetailState> mapEventToState(AccountDetailEvent event) async* {
    if (event is LoadAccountDetail) {
      yield* _mapLoadAccountDetailState();
    }
    {
      if (event is UpdateAccountDetail) {
        yield* _mapUpdateAccountDetailState(event);
      }
    }
  }

  Stream<AccountDetailState> _mapLoadAccountDetailState() async* {
    _transactionSubscription?.cancel();
    _transactionSubscription = transactionRepository.loadAccountDetail().listen(
          (detail) => add(UpdateAccountDetail(detail)),
        );
  }

  Stream<AccountDetailState> _mapUpdateAccountDetailState(
      UpdateAccountDetail event) async* {
    print("Shubh");
    yield AccountDetailLoadSuccess(event.accDetail);
  }

  @override
  Future<void> close() {
    _transactionSubscription?.cancel();
    return super.close();
  }
}
