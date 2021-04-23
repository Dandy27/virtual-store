import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.account_circle,
                color: Theme.of(context).primaryColor,
                size: 100,
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
              child: Text('Faça login para acessar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).primaryColor,
              ),),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor,
                ),
                  onPressed: (){
                  Navigator.of(context).pushNamed('/login');
                  },
                  child: const Text('LOGIN'))
            ],
          ),
        ),
      ),
    );
  }
}
