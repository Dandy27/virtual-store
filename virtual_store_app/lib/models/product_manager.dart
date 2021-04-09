import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:virtual_store_app/models/product.dart';

class ProductManager extends ChangeNotifier {

  ProductManager() {
    _loadAllProducts();
  }

  final Firestore firestore = Firestore.instance;

  List<Product> _allProducts = [];

  Future<void> _loadAllProducts() async {
    final QuerySnapshot snapProducts =
    await firestore.collection('products').getDocuments();

    _allProducts =
        snapProducts.documents.map((d) => Product.fromDocument(d)).toList();
  }

  @override
  void notifyListeners();

}