import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/base/screens/login/signup/signup_screen.dart';
import 'package:virtual_store_app/models/admin_users_manager.dart';
import 'package:virtual_store_app/models/cart_manager.dart';
import 'package:virtual_store_app/models/home_manager.dart';
import 'package:virtual_store_app/models/orders.manager.dart';
import 'package:virtual_store_app/models/product.dart';
import 'package:virtual_store_app/models/product_manager.dart';
import 'package:virtual_store_app/models/user_manager.dart';
import 'base/screens/address/address_screen.dart';
import 'base/screens/base_screen.dart';
import 'base/screens/cart/cart_screen.dart';
import 'base/screens/checkout/checkout_screen.dart';
import 'base/screens/edit_product/edit_product_screen.dart';
import 'base/screens/login/login_screen.dart';
import 'base/screens/product/product_screen.dart';
import 'base/screens/select_product/select_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
              cartManager..updateUser(userManager),
        ),
        ChangeNotifierProxyProvider<UserManager, OrdersManager>(
          create: (_) => OrdersManager(),
          lazy: false,
          update: (_, userManager, ordersManager) =>
              ordersManager..updateUser(userManager.user),
        ),
        ChangeNotifierProxyProvider<UserManager, AdminUsersManager>(
            create: (_) => AdminUsersManager(),
            lazy: false,
            update: (_, userManager, adminUsersManager) =>
                adminUsersManager..updateUser(userManager))
      ],
      child: MaterialApp(
        title: 'Virtual Loja',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 4, 125, 141),
            scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
            appBarTheme: const AppBarTheme(
              elevation: 0,
            )),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case '/product':
              return MaterialPageRoute(
                  builder: (_) => ProductScreen(settings.arguments as Product));
            case '/cart':
              return MaterialPageRoute(
                  builder: (_) => CartScreen(), settings: settings);
            case '/address':
              return MaterialPageRoute(
                  builder: (_) => AddressScreen(), settings: settings);
            case '/checkout':
              return MaterialPageRoute(builder: (_) => CheckoutScreen());
            case '/edit_product':
              return MaterialPageRoute(
                  builder: (_) =>
                      EditProductScreen(settings.arguments as Product));
            case '/select_product':
              return MaterialPageRoute(
                  builder: (_) => SelectProductScreen(), settings: settings);
            case '/base':
            default:
              return MaterialPageRoute(
                  builder: (_) => BaseScreen(), settings: settings);
          }
        },
      ),
    );
  }
}
