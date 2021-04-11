import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:virtual_store_app/models/product.dart';
import 'package:virtual_store_app/models/user.dart';
import 'package:virtual_store_app/models/user_manager.dart';
import 'cart_product.dart';

class CartManager  extends ChangeNotifier {
  List<CartProduct> items = [];

  User user;

  void updateUser(UserManager userManager) {
    user = userManager.user;
    items.clear();

    if(user != null){
      _loadCartItems();
    }
  }

  Future<void>_loadCartItems()async{
    final QuerySnapshot cartSnap = await user.cartReference.getDocuments();

    items = cartSnap.documents.map((d) => CartProduct.fromDocuments(d)..addListener(_onItemUpdate)).toList();
  }


  void addToCart(Product product) {
     try{
       final e = items.firstWhere((p) => p.stackable(product));
       e.increment();
     } catch(e){
       final cartProduct = CartProduct.fromProduct(product);
       cartProduct.addListener(_onItemUpdate);
       items..add(cartProduct);
       user.cartReference.add(cartProduct.toCartItemMap()).then((doc) => cartProduct.id = doc.documentID);
     }
     notifyListeners();
  }

  void removeOfCart(CartProduct cartProduct){
    items.removeWhere((p) => p.id == cartProduct.id);
    user.cartReference.document(cartProduct.id).delete();
    cartProduct.removeListener((_onItemUpdate));
    notifyListeners();

  }

  void _onItemUpdate(){
    for(final cartProduct in items){
      if(cartProduct.quantity == 0){
        removeOfCart(cartProduct);
      }
      _updateCartProduct(cartProduct);
    }
  }

  void _updateCartProduct(CartProduct cartProduct){
    user.cartReference.document(cartProduct.id).updateData(cartProduct.toCartItemMap());
  }

}
