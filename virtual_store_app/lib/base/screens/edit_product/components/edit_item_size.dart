

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_store_app/commom/custom_drawer/custom_icon_button.dart';
import 'package:virtual_store_app/models/item_size.dart';

class EditItemSize extends StatelessWidget {
  const EditItemSize(
      {Key key, this.size, this.onRemove, this.onMoveUp, this.onMoveDown})
      : super(key: key);

  final ItemSize size;
  final VoidCallback onRemove;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 25,
          child: TextFormField(
            initialValue: size.name,
            decoration: InputDecoration(labelText: 'Título', isDense: true),
            validator: (name) {
              if (name.isEmpty) return 'Inválido';
              return null;
            },
            onChanged: (name) => size.name = name,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          flex: 25,
          child: TextFormField(
            initialValue: size.stock?.toString(),
            decoration:
                const InputDecoration(labelText: 'Estoque', isDense: true),
            validator: (stock) {
              if (int.tryParse(stock) == null) return 'Inválido';
              return null;
            },
            onChanged: (stock) => size.stock = int.tryParse((stock)),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 50,
          child: TextFormField(
            initialValue: size.price?.toStringAsFixed(2),
            decoration: const InputDecoration(
                labelText: 'Preço', isDense: true, prefixText: 'R\$'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (price) {
              if (num.tryParse(price) == null) return 'Inválido';
              return null;
            },
            onChanged: (price) => size.price = num.tryParse(price),
          ),
        ),
        CustomIconButton(
          iconData: Icons.remove,
          color: Colors.red,
          onTap: onRemove,
        ),
        CustomIconButton(
          iconData: Icons.arrow_drop_up,
          color: Colors.black,
          onTap: onMoveUp,
        ),
        CustomIconButton(
          iconData: Icons.arrow_drop_down,
          color: Colors.black,
          onTap: onMoveDown,
        )
      ],
    );
  }
}
