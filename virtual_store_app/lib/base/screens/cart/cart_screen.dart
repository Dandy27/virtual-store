import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/commom/custom_drawer/empty_card.dart';
import 'package:virtual_store_app/commom/custom_drawer/login_card.dart';
import 'package:virtual_store_app/commom/custom_drawer/price_card.dart';
import 'package:virtual_store_app/models/cart_manager.dart';

import 'components/cart_tile.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Consumer<CartManager>(builder: (_, cartManager, __) {
          if(cartManager.user == null){
            return LoginCard();
          }

          if(cartManager.items.isEmpty){
            return EmptyCard(
              iconData: Icons.remove_shopping_cart,
              title: 'Nenhum produto no carrinho!',
            );
          }

        return ListView(
          children: [
            Column(
              children: cartManager.items
                  .map((cartProduct) => CartTile(cartProduct))
                  .toList(),
            ),
            PriceCard(
              buttonText: 'Continuar para Entrega',
              onPressed: cartManager.isCartValid ? () {
Navigator.of(context).pushNamed('/address');
              } : null,
            ),
          ],
        );
      }),
    );
  }
}
