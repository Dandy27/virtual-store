import 'package:flutter/material.dart';

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
          AddressCard()
        ],
      ),
    );
  }
}
