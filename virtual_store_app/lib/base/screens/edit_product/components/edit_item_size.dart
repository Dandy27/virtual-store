import 'package:flutter/material.dart';
import 'package:virtual_store_app/models/item_size.dart';

class EditItemSize extends StatelessWidget {

  const EditItemSize({this.size});
  final ItemSize size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: size.name,
            decoration: InputDecoration(
              labelText: 'Título',
              isDense: true
            ),
          ),
        ),
        const SizedBox(width: 4,),
        Expanded(
          child: TextFormField(
            initialValue: size.stock.toString(),
            decoration: const InputDecoration(
                labelText: 'Estoque',
                isDense: true
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 5,),
        Expanded(
          child: TextFormField(
            initialValue: size.price.toStringAsFixed(2),
            decoration: const InputDecoration(
                labelText: 'Preço',
                isDense: true
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
        ),
      ],
    );
  }
}
