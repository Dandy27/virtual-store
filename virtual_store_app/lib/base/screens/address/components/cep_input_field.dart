import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CepInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
      decoration: const InputDecoration(
        isDense: true,
        labelText: 'CEP',
        hintText: '12.345-678'
      ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
            onPressed: (){},
            child: Text('Buscar CEP'))
      ],
    );
  }
}
