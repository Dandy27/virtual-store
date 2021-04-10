import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:virtual_store_app/models/product.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {

    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Carousel(
              images: product.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 4,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
              dotSpacing: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'A partir de',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                ),
                Text('R\$ 243,00',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryColor
                ),),
                Padding(padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  ),)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
