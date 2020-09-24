import 'package:meta/meta.dart';
import 'package:transaction_demo/entity/transaction_entity.dart';

@immutable
class Transaction {
  final String name;
  final String timestamp;
  final double amount;
  final String referenceNumber;
  final String remark;

  Transaction(this.name, this.timestamp, this.amount, this.referenceNumber,
      this.remark);

  TransactionEntity toEntity() {
    return TransactionEntity(name, timestamp, amount, referenceNumber, remark);
  }

  static Transaction fromEntity(TransactionEntity entity) {
    return Transaction(entity.name, entity.timestamp, entity.amount,
        entity.referenceNumber, entity.remark);
  }
}

@immutable
class AccountHolderDetail {
  final String group;
  final String fullName;
  final String email;
  final String loginName;
  final String mobileNumber;
  final String nationality;
  final String purposeOfAcc;
  final String bankName;
  final String address;
  final int accountNumber;
  final int referenceNumber;
  final String swiftNumber;

  AccountHolderDetail(
      this.group,
      this.fullName,
      this.email,
      this.loginName,
      this.mobileNumber,
      this.nationality,
      this.purposeOfAcc,
      this.bankName,
      this.address,
      this.accountNumber,
      this.referenceNumber,
      this.swiftNumber);

  AccountHolderDetailEntity toEntity() {
    return AccountHolderDetailEntity(
        group,
        fullName,
        email,
        loginName,
        mobileNumber,
        nationality,
        purposeOfAcc,
        bankName,
        address,
        accountNumber,
        referenceNumber,
        swiftNumber);
  }

  static AccountHolderDetail fromEntity(AccountHolderDetailEntity entity) {
    return AccountHolderDetail(
        entity.group,
        entity.fullName,
        entity.email,
        entity.loginName,
        entity.mobileNumber,
        entity.nationality,
        entity.purposeOfAcc,
        entity.bankName,
        entity.address,
        entity.accountNumber,
        entity.referenceNumber,
        entity.swiftNumber);
  }
}
