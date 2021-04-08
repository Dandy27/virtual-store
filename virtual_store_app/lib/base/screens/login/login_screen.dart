import 'package:flutter/material.dart';
import 'package:virtual_store_app/helpers/validators.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/models/user.dart';
import 'package:virtual_store_app/models/user_manager.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final  GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (email) {
                    if (!emailValid(email)) return 'Email inválido';
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass) {
                    if (pass.isEmpty || pass.length < 6)
                      return 'Senha inválida';
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Esqueci minha senha',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        context.read<UserManager>().signIn(
                            user: User(
                                email: emailController.text,
                                password: passController.text),
                            onFail: (e) {
                              scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text('Falha ao entrar: $e '),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                            onSuccess: () {
                              // TODO FECHAR A TELA DE LOGIN
                            });
                      }
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
