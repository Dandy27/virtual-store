import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/models/cart_manager.dart';

class CepInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final TextEditingController cepController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: cepController,
          decoration: const InputDecoration(
              isDense: true, labelText: 'CEP', hintText: '12.345-678'),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
          keyboardType: TextInputType.number,
          validator: (cep) {
            if (cep.isEmpty)
              return 'Campo Obrigatório';
            else if (cep.length != 10) return 'CEP Inválido';
            return null;
          },
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: primaryColor),
            onPressed: () {
              if (Form.of(context).validate()) {
                context.read<CartManager>().getAddress(cepController.text);
              }
            },
            child: Text('Buscar CEP'))
      ],
    );
  }
}
