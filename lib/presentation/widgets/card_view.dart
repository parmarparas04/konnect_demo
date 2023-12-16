import 'package:flutter/material.dart';

Widget getCard(
    {EdgeInsets edgeInsets = const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
    double circlurRadius = 10.0,
    Color color = Colors.grey,
    required Widget child}) {
  return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circlurRadius),
      ),
      margin: edgeInsets,
      color: color,
      shadowColor: Colors.grey.shade200,
      child: child);
}
