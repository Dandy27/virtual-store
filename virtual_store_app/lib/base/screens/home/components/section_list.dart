import 'package:flutter/material.dart';
import 'package:virtual_store_app/base/screens/home/components/section_header.dart';
import 'package:virtual_store_app/models/section.dart';

class SectionList extends StatelessWidget {
  SectionList(this.section);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(section),
        ],
      ),
    );
  }
}
