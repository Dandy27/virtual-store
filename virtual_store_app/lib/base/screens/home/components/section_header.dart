import 'package:flutter/material.dart';
import 'package:virtual_store_app/commom/custom_drawer/custom_icon_button.dart';
import 'package:virtual_store_app/models/home_manager.dart';
import 'package:virtual_store_app/models/section.dart';
import 'package:provider/provider.dart';

class SectionHeader extends StatelessWidget {


  const SectionHeader(this.section);
  final Section section;

  @override
  Widget build(BuildContext context) {

    final homeManager = context.watch<HomeManager>();
    if(homeManager.editing){
      return Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: section.name,
              decoration: InputDecoration(
                hintText: 'Titulo',
                isDense: true
              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              onChanged: (text) => section.name = text,
            ),
          ),
          CustomIconButton(
            iconData: Icons.remove,
            color: Colors.white,
            onTap: (){
              homeManager.removeSection(section);
            },
          )
        ],
      );
    }else{
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(section.name ?? ' love',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white
          ),),
      );
    }
  }
}
