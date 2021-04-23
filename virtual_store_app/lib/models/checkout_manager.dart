import 'package:flutter/cupertino.dart';
import 'package:virtual_store_app/models/cart_manager.dart';

class CheckoutManager extends ChangeNotifier{

  CartManager cartManager;

  void updateCart(CartManager cartManager){
    this.cartManager = cartManager;

    print(cartManager.productsPrice);
  }


  void checkout(){
    _decrementStock();
  }

  void _decrementStock(){
    /// 1. Ler todos os estoques
    /// 2. Decrementando localmente os estoques
    /// 3. Salvar os estoques no firebase

    //
  }

}