import 'package:flutter/material.dart';

//TODO: Change color to images

class Category {
  final String id;
  final String title;
  final Color color;

  const Category(
      {required this.id, required this.title, this.color = Colors.blueGrey});
}
