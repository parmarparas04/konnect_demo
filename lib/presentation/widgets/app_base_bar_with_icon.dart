import 'package:flutter/material.dart';
import 'package:konnect/presentation/manager/font_manager.dart';
import 'package:konnect/presentation/manager/styles_manager.dart';
import 'package:konnect/presentation/widgets/base_app_bar.dart';
import 'package:konnect/presentation/widgets/text_view.dart';

BaseAppBar getBaseAppBar(String text, BuildContext context,
    {bool isWidgetDisplace = true}) {
  var widgets = <Widget>[
    IconButton(
      icon: const Icon(Icons.search, color: Colors.black),
      onPressed: () {},
    ),
    const SizedBox(
      width: 10,
    ),
    GestureDetector(
        onTap: () {},
        child: const Icon(Icons.notification_add, color: Colors.black)),
    const SizedBox(
      width: 20,
    )
  ];
  return BaseAppBar(
    title: getTextView(
      text,
      getBoldStyle(color: Colors.black, fontSize: FontSize.s14),
    ),
    backgroundColor: Colors.grey.shade100,
    appBar: AppBar(
      elevation: 5.0,
      backgroundColor: Colors.grey,
      actions: [],
    ),
    widgets: widgets,
  );
}
