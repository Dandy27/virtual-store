import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'E-mail'
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (mail){
                  return null;
                },
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Senha'
                ),
                autocorrect: false,
                obscureText: true,
                validator: (pass){
                  if(pass.isEmpty || pass.length < 6)
                    return 'Senha inválida';
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Esqueci minha senha',style: TextStyle(color: Colors.black),),

                ),
              ),
              const SizedBox(height: 16,),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: (){},
                  child: const Text('Entrar', style: TextStyle(fontSize: 20),) ,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
