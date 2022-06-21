import '../../../../src.dart';

class AccountModel {
  final int id;
  final String name;
  final String phoneNumber;

  AccountModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id') ||
        !json.containsKey('name') ||
        !json.containsKey('phone_number')) {
      throw Exception();
    }
    return AccountModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
    );
  }

  /// Method to transform the `AccountModel` in a `AccountEntity`.
  AccountEntity toEntity() => AccountEntity(
        id,
        name,
        phoneNumber,
      );
}
