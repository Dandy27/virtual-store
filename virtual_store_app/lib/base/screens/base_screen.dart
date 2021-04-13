import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/base/screens/home/home_screen.dart';
import 'package:virtual_store_app/base/screens/products/products_screen.dart';
import 'package:virtual_store_app/commom/custom_drawer/custom_drawer.dart';
import 'package:virtual_store_app/models/page_manager.dart';
import 'package:virtual_store_app/models/user_manager.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return Provider(
      create: (_) => PageManager(pageController),
      child: Consumer<UserManager>(
        builder: (_, userManager, __){
          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              ProductScreen(),
              Scaffold(
                drawer: CustomDrawer(),
                appBar: AppBar(
                  title: const Text('Home 3'),
                ),
              ),
              Scaffold(
                drawer: CustomDrawer(),
                appBar: AppBar(
                  title: const Text('Home 3'),
                ),
              ),
              if(userManager.adminEnabled)
                ...[Scaffold(
                  drawer: CustomDrawer(),
                  appBar: AppBar(
                    title: const Text('Usuários'),
                  ),
                ),
                  Scaffold(
                    drawer: CustomDrawer(),
                    appBar: AppBar(
                      title: const Text('Pedidos'),
                    ),
                  ),]

            ],
          );
        },

      ),
    );
  }
}
