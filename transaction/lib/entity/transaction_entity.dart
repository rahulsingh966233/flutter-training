import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String name;
  final String timestamp;
  final double amount;
  final String referenceNumber;
  final String remark;

  TransactionEntity(this.name, this.timestamp, this.amount,
      this.referenceNumber, this.remark);

  @override
  List<Object> get props => [name, timestamp, amount, referenceNumber, remark];

  Map<String, Object> toJson() {
    return {
      'name': name,
      'timestamp': timestamp,
      'amount': amount,
      'reference_number': referenceNumber,
      'remark': remark
    };
  }

  static TransactionEntity fromJson(Map<String, Object> json) {
    return TransactionEntity(
        json['name'] as String,
        json['timestamp'] as String,
        json['amount'] as double,
        json['reference_number'] as String,
        json['remark'] as String);
  }
}

class AccountHolderDetailEntity extends Equatable {
  final String group;
  final String fullName;
  final String loginName;
  final String mobileNumber;
  final String nationality;
  final String purposeOfAcc;
  final String bankName;
  final String address;
  final int accountNumber;
  final int referenceNumber;
  final String swiftNumber;

  AccountHolderDetailEntity(
      this.group,
      this.fullName,
      this.loginName,
      this.mobileNumber,
      this.nationality,
      this.purposeOfAcc,
      this.bankName,
      this.address,
      this.accountNumber,
      this.referenceNumber,
      this.swiftNumber);

  @override
  List<Object> get props => [
        group,
        fullName,
        loginName,
        mobileNumber,
        nationality,
        purposeOfAcc,
        bankName,
        address,
        accountNumber,
        referenceNumber,
        swiftNumber
      ];

  Map<String, Object> toJson() {
    return {
      'group': group,
      'fullName': fullName,
      'loginName': loginName,
      'mobileNumber': mobileNumber,
      'nationality': nationality,
      'purposeOfAcc': purposeOfAcc,
      'bankName': bankName,
      'address': address,
      'accountNumber': accountNumber,
      'referenceNumber': referenceNumber,
      'swiftNumber': swiftNumber
    };
  }

  static AccountHolderDetailEntity fromJson(Map<String, Object> json) {
    return AccountHolderDetailEntity(
      json['group'] as String,
      json['fullName'] as String,
      json['loginName'] as String,
      json['mobileNumber'] as String,
      json['nationality'] as String,
      json['purposeOfAcc'] as String,
      json['bankName'] as String,
      json['address'] as String,
      json['accountNumber'] as int,
      json['referenceNumber'] as int,
      json['swiftNumber'] as String,
    );
  }
}
