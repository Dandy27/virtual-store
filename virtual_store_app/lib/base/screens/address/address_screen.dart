import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/commom/custom_drawer/price_card.dart';
import 'package:virtual_store_app/models/cart_manager.dart';

import 'components/address_card.dart';

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entregue'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AddressCard(),
          Consumer<CartManager>(
              builder: (_, cartManager, __){
               return  PriceCard(
                  buttonText: 'Continuar para Pagamento',
                  onPressed: cartManager.isAddressValid ? (){
              Navigator.of(context).pushNamed('/checkout');
                  }: null,
                );
              }
          ),
        ],
      ),
    );
  }
}
