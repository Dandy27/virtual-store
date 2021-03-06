import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/commom/custom_drawer/custom_icon_button.dart';
import 'package:virtual_store_app/models/cart_product.dart';

class CartTile extends StatelessWidget {
  const CartTile(this.cartProduct);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: cartProduct,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.network(cartProduct.product.images.first),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartProduct.product.name,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Tamanho: ${cartProduct.size}',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                    Consumer<CartProduct>(
                        builder: (_, cartProduct, __) {
                          if(cartProduct.hasStock)
                      return Text(
                        'R\$ ${cartProduct.unitPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      );
                      else
                        return Text(''
                      'Sem estoque disponivel',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red
                        ),);
                    })
                  ],
                ),
              )),
              Consumer<CartProduct>(builder: (_, cartProduct, __) {
                return Column(
                  children: [
                    CustomIconButton(
                      iconData: Icons.add,
                      color: Theme.of(context).primaryColor,
                      onTap: cartProduct.increment,
                    ),
                    Text(
                      '${cartProduct.quantity}',
                      style: TextStyle(fontSize: 20),
                    ),
                    CustomIconButton(
                      iconData: Icons.remove,
                      color: cartProduct.quantity > 1
                          ? Theme.of(context).primaryColor
                          : Colors.red,
                      onTap: cartProduct.decrement,
                    )
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
