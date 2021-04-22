import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/commom/custom_drawer/custom_icon_button.dart';
import 'package:virtual_store_app/models/address.dart';
import 'package:virtual_store_app/models/cart_manager.dart';

class CepInputField extends StatelessWidget {
  CepInputField(this.address);
  final Address address;
  final TextEditingController cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    if (address.zipCode == null)
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
    else
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'CEP: ${address.zipCode}',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            CustomIconButton(
              iconData: Icons.edit,
              color: primaryColor,
              size: 20,
              onTap: (){
                context.read<CartManager>().removeAddress();
              },
            )
          ],
        ),
      );
  }
}
