import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:virtual_store_app/helpers/firebase_errors.dart';
import 'package:virtual_store_app/models/user.dart';

class UserManager  extends ChangeNotifier{
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    setLoading(true);
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      print(result.user.uid);

      onSuccess();

    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }

    setLoading(false);
  }

  void setLoading(bool value){
    loading = value;
    notifyListeners();
  }

}
