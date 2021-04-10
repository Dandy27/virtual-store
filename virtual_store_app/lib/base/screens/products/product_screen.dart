import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/commom/custom_drawer/custom_drawer.dart';
import 'package:virtual_store_app/models/product_manager.dart';

import 'components/product_list_tile.dart';
import 'components/search_dialog.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showDialog(context: context, builder: (_) => SearchDialog());
          })
        ],
      ),
  body: Consumer<ProductManager>(
    builder: (_, productManager, __){
      return ListView.builder(
        padding: EdgeInsets.all(4),
        itemCount: productManager.allProducts.length,
          itemBuilder: (_, index){
          return ProductListTile(productManager.allProducts[index]);
      });
    },
  ),
    );
  }
}
