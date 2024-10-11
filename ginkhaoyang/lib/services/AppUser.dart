import 'package:ginkhaoyang/services/Account.dart';

class AppUser {
  String firstName;
  String lastName;
  String email;
  String telephone;
  Account account;

  AppUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.telephone,
    required this.account,
  });

  // Method to convert user to JSON format for Firestore storage
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'telephone': telephone,
      'account': account.toJson(),
    };
  }
}
