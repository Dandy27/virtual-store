import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:virtual_store_app/models/cart_manager.dart';

class CheckoutManager extends ChangeNotifier{

  CartManager cartManager;
  final Firestore firestore = Firestore.instance;

  void updateCart(CartManager cartManager){
    this.cartManager = cartManager;

    print(cartManager.productsPrice);
  }


  void checkout(){
    _decrementStock();

    _getOrderId().then((value) => print(value));
  }

  Future<int> _getOrderId()async {
    final ref = firestore.document('aux/ordercounter');

 try{
   final result = await firestore.runTransaction((tx) async{
     final doc = await tx.get(ref);
     final orderId = doc.data['current'] as int;
     await tx.update(ref, {'current' : orderId + 1});
     return {'orderId' : orderId};
   });
   return result['orderId'] as int;
 }catch(e){
   debugPrint(e.toString());
   return Future.error('Falha ao gerar númerro do pedido');
 }



  }

  void _decrementStock(){
    /// 1. Ler todos os estoques
    /// 2. Decrementando localmente os estoques
    /// 3. Salvar os estoques no firebase

    //
  }

}