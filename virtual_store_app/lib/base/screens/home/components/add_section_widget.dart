import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_store_app/models/home_manager.dart';
import 'package:virtual_store_app/models/section.dart';

class AddSectionWidget extends StatelessWidget {

  const AddSectionWidget(this.homeManager);
  final HomeManager homeManager;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
            child: TextButton(
          onPressed: () {
            homeManager.addSection(Section(type: 'List'));
          },
          child: const Text('Adicionar Lista',style: TextStyle(color: Colors.white),),
        )),
        Expanded(
            child: TextButton(
              onPressed: () {
                homeManager.addSection(Section(type: 'Staggered'));
              },
              child: const Text('Adicionar Grade',style: TextStyle(color: Colors.white)),
            ))

      ],
    );
  }
}
