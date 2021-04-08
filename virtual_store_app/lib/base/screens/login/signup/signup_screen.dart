import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_store_app/helpers/validators.dart';
import 'package:virtual_store_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/models/user_manager.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormField(
                  onSaved: (name) => user.name = name,
                  validator: (name) {
                    if (name.isEmpty)
                      return 'Campo obrigatŕio';
                    else if (name.trim().split('').length <= 1)
                      return 'Preencha seu Nome completo';
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Nome Completo'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    onSaved: (email) => user.email = email,
                    validator: (email) {
                      if (email.isEmpty)
                        return 'Campo obrigatório';
                      else if (!emailValid(email)) return 'E-mail inválido';
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'E-mail')),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  onSaved: (pass) => user.password = pass,
                  validator: (pass) {
                    if (pass.isEmpty)
                      return 'Campo obrigatório';
                    else if (pass.length < 6) return 'Senha muito curta';
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Senha'),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  onSaved: (pass) => user.confirmPassword = pass,
                  validator: (pass) {
                    if (pass.isEmpty)
                      return 'Campo obrigatório';
                    else if (pass.length < 6) return 'Senha muito curta';
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Repitir Senha'),
                  obscureText: true,
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
                        formKey.currentState.save();

                        if (user.password != user.confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Senhas não coincidem!'),
                            backgroundColor: Colors.red,
                          ));
                          return;
                        }
                        context.read<UserManager>().signUp(
                          user: user,
                          onSuccess: (){
                            debugPrint('sucesso');
                            // TODO: POP
                          },
                          onFail: (e){
                            ScaffoldMessenger.of(context).showSnackBar((
                            SnackBar(
                              content: Text('Falha ao cadastrar: $e'),
                              backgroundColor: Colors.red,
                            )
                            ));
                          }
                        );
                      }
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
