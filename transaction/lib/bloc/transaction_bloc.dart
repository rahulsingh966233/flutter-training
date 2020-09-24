import 'dart:async';

import 'package:transaction_demo/bloc/transaction_event.dart';
import 'package:transaction_demo/bloc/transaction_state.dart';
import 'package:transaction_demo/repository/transaction_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository transactionRepository;
  StreamSubscription _transactionSubscription;

  TransactionBloc({@required this.transactionRepository})
      : super(TransactionsLoadInProgress());

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is LoadTransactions) {
      yield* _mapLoadTransactionState();
    }
    {
      if (event is UpdateTransactions) {
        yield* _mapUpdateTransactionState(event);
      }
    }
  }

  Stream<TransactionState> _mapLoadTransactionState() async* {
    _transactionSubscription?.cancel();
    _transactionSubscription = transactionRepository.loadTransactions().listen(
          (todos) => add(UpdateTransactions(todos)),
        );
  }

  Stream<TransactionState> _mapUpdateTransactionState(
      UpdateTransactions event) async* {
    yield TransactionLoadSuccess(event.transactionList);
  }

  @override
  Future<void> close() {
    _transactionSubscription?.cancel();
    return super.close();
  }
}
