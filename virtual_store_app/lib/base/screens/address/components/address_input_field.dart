import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_store_app/models/address.dart';

class AddressInputField extends StatelessWidget {

  const AddressInputField(this.address);
  final Address address;

  @override
  Widget build(BuildContext context) {

    final primaryColor = Theme.of(context).primaryColor;

    String emptyValidator(String text) =>
        text.isEmpty ? 'Campo obrigatório' : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          initialValue: address.street,
          decoration: const InputDecoration(
            isDense: true,
            labelText: 'Rua/Avenida',
            hintText: 'Av Paulista',
          ),
          validator: emptyValidator,
          onSaved: (t) => address.street = t ,
        ),
        Row(
          children: [
          Expanded(
              child: TextFormField(
                initialValue: address.number,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: 'Número',
                  hintText: '123'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.number,
                validator: emptyValidator,
                onSaved: (t) => address.number = t,
              )
          ),
            const SizedBox(
              width: 16,
            ),
            Expanded(child: TextFormField(
              initialValue: address.complement,
              decoration: const InputDecoration(
                isDense: true,
                labelText: 'Complemento',
                hintText: 'Opicional'
              ),
              onSaved: (t) => address.complement = t,
            ))
          ],
        ),
        TextFormField(
          initialValue: address.district,
          decoration: const InputDecoration(
            isDense: true,
            labelText: 'Bairro',
            hintText: 'Taquaral'
          ),
          validator: emptyValidator,
          onSaved: (t) => address.district,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
                child: TextFormField(
                  enabled: false,
                  initialValue: address.city,
                  decoration: const InputDecoration(
                    isDense: true,
                    labelText: 'Cidade',
                    hintText: 'Campinas',
                  ),
                  validator: emptyValidator,
                  onSaved: (t) => address.city = t,
            )),
            const SizedBox(width: 16,),
            Expanded(child: TextFormField(
              autocorrect: false,
              textCapitalization: TextCapitalization.characters,
              initialValue: address.state,
              decoration: const InputDecoration(
                isDense: true,
                labelText: 'UF',
                hintText: 'SP',
                counterText: '',
              ),
              maxLength: 2,
              validator: (e) {
                if(e.isEmpty){
                  return 'Campo obrigatório';
                } else if(e.length != 2){
                  return 'Inválido';
                }
                return null;
              },
              onSaved: (t) => address.state = t,
            ))
          ],
        ),
        const SizedBox(height: 8,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryColor
          ),
          onPressed: (){},
            child: const Text('Calcular Frete'),
        )
      ],
    );
  }
}
