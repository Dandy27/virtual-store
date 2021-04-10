import 'package:flutter/material.dart';
import 'package:virtual_store_app/models/product.dart';

class ProductListTile extends StatelessWidget {

  ProductListTile(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4)
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            AspectRatio(aspectRatio: 1,
            child: Image.network(product.images.first,
            fit: BoxFit.cover,),),
            const SizedBox(width: 16,),
            Expanded(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),),
                    Padding(padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'A partir de',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12
                      ),
                    ),),
                    Text(
                      'R\$ 243,99',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).primaryColor
                      ),
                    )
                  ],
                ) )
          ],
        ),
      ),
    );
  }
}