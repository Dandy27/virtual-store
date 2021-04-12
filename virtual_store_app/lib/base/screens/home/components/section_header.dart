import 'package:flutter/material.dart';
import 'package:virtual_store_app/models/section.dart';

class SectionHeader extends StatelessWidget {


  const SectionHeader(this.section);
  final Section section;

  @override
  Widget build(BuildContext context) {
    return Text(section.name,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w800,
      color: Colors.white
    ),);
  }
}
