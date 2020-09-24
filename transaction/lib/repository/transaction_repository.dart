import 'package:transaction_demo/api/api_client.dart';
import 'package:transaction_demo/model/transaction.dart';

class TransactionRepository{

  ApiClient apiClient;

  TransactionRepository(){
    this.apiClient = ApiClient(baseUrl: "");
  }

  Stream<List<Transaction>> loadTransactions() async* {
      yield* apiClient.fetchTransactions();
  }

  Stream<List<AccountHolderDetail>> loadAccountDetail() async* {
    yield* apiClient.fetchAccountDetail();
  }
}