import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
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
          child: ListView(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nome Completo'
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: 'E-mail'
                  )
              ),
              const SizedBox(height: 16,),
              TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Senha'
                  ),
                obscureText: true,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Repitir Senha'
                  ),
                obscureText: true,
              ),
              const SizedBox(height: 16,),
              SizedBox(height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: (){},
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
    );
  }
}
