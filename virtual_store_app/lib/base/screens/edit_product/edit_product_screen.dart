
import 'package:flutter/material.dart';
import 'package:virtual_store_app/models/product.dart';

import 'components/images_form.dart';

class EditProductScreen extends StatelessWidget {
  EditProductScreen(this.product);
  final Product product;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Editar Produto'
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            ImagesForm(product),
            ElevatedButton(onPressed: (){
              if(formKey.currentState.validate()){
                print('válido');
              } else{
                print('inválido');
              }
            },
                child:const Text('Salvar') )
          ],
        ),
      ),
    );
  }
}
