import 'package:flutter/material.dart';
import 'package:virtual_store_app/base/screens/home/components/item_tile.dart';
import 'package:virtual_store_app/base/screens/home/components/section_header.dart';
import 'package:virtual_store_app/models/section.dart';

class SectionList extends StatelessWidget {
  SectionList(this.section);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(section),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (_, index){
                return ItemTile(section.items[index]);
                },
                separatorBuilder: (_, __) => const SizedBox(width: 4,),
                itemCount: section.items.length),
          )
        ],
      ),
    );
  }
}
