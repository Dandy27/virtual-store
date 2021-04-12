import 'package:flutter/material.dart';
import 'package:virtual_store_app/commom/custom_drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: const [
                Color.fromARGB(255, 211, 118, 130),
                Color.fromARGB(255, 253, 181, 168)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  snap: true,
                  floating: true,
                  flexibleSpace: const FlexibleSpaceBar(
                    title: Text('Suzzara'),
                    centerTitle: true,
                  ),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.white,
                        onPressed: () => Navigator.of(context).pushNamed('/cart'))
                  ],
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 2000,
                    width: 200,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
