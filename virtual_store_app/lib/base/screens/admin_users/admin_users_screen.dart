import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/models/admin_users_manager.dart';

class AdminUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        centerTitle: true,
      ),
      body: Consumer<AdminUsersManager>(builder: (_, adminUserManager, __){
        return AlphabetListScrollView(
          itemBuilder: (_, index){
            return ListTile(
              title: Text(adminUserManager.users[index].name,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.white
              ),),
              subtitle:Text(adminUserManager.users[index].email,
              style: TextStyle(
                color: Colors.white
              ),) ,
            );
          },
          highlightTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          indexedHeight: (index) => 60,
          strList: adminUserManager.names,
          showPreview: true,
        );
      }),
    );
  }
}
