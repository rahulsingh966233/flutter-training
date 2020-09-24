import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:transaction_demo/entity/transaction_entity.dart';

import '../model/transaction.dart';

class ApiClient {
  String baseUrl;
  final http.Client httpClient;

  ApiClient({
    http.Client httpClient,
    this.baseUrl = "<api url>",
  }) : this.httpClient = httpClient ?? http.Client();

  Stream<List<Transaction>> fetchTransactions() async* {
    // final response = await httpClient.get(Uri.parse("$baseUrl"));
    final response = '''
    {
      "items":[
      {
        "name": "Transaction Fee",
        "timestamp": "07-22-2020 09:29 pm",
        "amount": -20.0,
        "reference_number": "FV000000713",
        "remark": "Transaction Fee"
      },
      {
        "name": "Nitin Agarwal",
        "timestamp": "07-22-2020 09:29 pm",
        "amount": 20.0,
        "reference_number": "FV000000713",
        "remark": "Transaction Fee"
      },
      {
        "name": "Kinsale Corp. Ltd.",
        "timestamp": "07-22-2020 09:29 pm",
        "amount": 20.0,
        "reference_number": "FV000000713",
        "remark": "Transaction Fee"
      },
      {
        "name": "Transaction Fee",
        "timestamp": "07-22-2020 09:29 pm",
        "amount": -30.0,
        "reference_number": "FV000000713",
        "remark": "Transaction Fee"
      },
      {
        "name": "Transaction Fee",
        "timestamp": "07-22-2020 09:29 pm",
        "amount": -10.0,
        "reference_number": "FV000000713",
        "remark": "Transaction Fee"
      },
      {
        "name": "Nitin Agarwal",
        "timestamp": "07-22-2020 09:29 pm",
        "amount": 20.0,
        "reference_number": "FV000000713",
        "remark": "Transaction Fee"
      },
      {
        "name": "Kinsale Corp. Ltd.",
        "timestamp": "07-22-2020 09:29 pm",
        "amount": 20.0,
        "reference_number": "FV000000713",
        "remark": "Transaction Fee"
      },
      {
        "name": "Transaction Fee",
        "timestamp": "07-22-2020 09:29 pm",
        "amount": -30.0,
        "reference_number": "FV000000713",
        "remark": "Transaction Fee"
      },
      {
        "name": "Transaction Fee",
        "timestamp": "07-22-2020 09:29 pm",
        "amount": -10.0,
        "reference_number": "FV000000713",
        "remark": "Transaction Fee"
      }
      ]
    }
    ''';
    Map<String, dynamic> map = json.decode(response);
    List<dynamic> results = map["items"];
    yield results
        .map((dynamic item) => Transaction.fromEntity(
            TransactionEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  Stream<List<AccountHolderDetail>> fetchAccountDetail() async* {
    final response = '''
    {
     "details": [
     {
     "group": "Individual",
      "fullName": "Miles Paschini",
      "loginName": "miles7777",
      "email" : "miles+7777@fvbank.us",
      "mobileNumber": "+1 858-281-7777",
      "nationality": "United States of America(USA)",
      "purposeOfAcc": "Personal Banking",
      "bankName": "Metropolitan Commericial Bank",
      "address": "99 Park Avenue, New York, NY 10016",
      "accountNumber": 299006891,
      "referenceNumber": 7801000001,
      "swiftNumber": "MCBEUS33"
      } 
     ]
    }
    ''';
    Map<String, dynamic> map = json.decode(response);
    List<dynamic> results = map["details"];
    print("sdssjfhsjf$results");
    yield results
        .map((dynamic item) => AccountHolderDetail.fromEntity(
            AccountHolderDetailEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }
}
