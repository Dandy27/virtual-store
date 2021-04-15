import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:virtual_store_app/models/user.dart';
import 'package:virtual_store_app/models/user_manager.dart';

class AdminUsersManager extends ChangeNotifier {
  List<User> users = [];

  final Firestore firestore = Firestore.instance;

  void updateUser(UserManager userManager) {
    if (userManager.adminEnabled) {
      _listenToUsers();
    }
  }

  void _listenToUsers() {
    firestore.collection('users').getDocuments().then((snapshot) {
      users = snapshot.documents.map((e) => User.fromDocument(e)).toList();
      users
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      notifyListeners();
    });

    users.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    notifyListeners();
  }

  List<String> get names => users.map((e) => e.name).toList();
}
