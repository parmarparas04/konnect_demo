import 'package:konnect/presentation/manager/styles_manager.dart';
import 'package:konnect/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';

Text _getAppTextView(String text,
    {required TextStyle textStyle, TextAlign textAlign = TextAlign.left}) {
  return getTextView(text, textStyle, textAlign: textAlign);
}

Text getAppRegularTextView(String text,
    {required BuildContext context,
    double fontSize = 14,
    TextAlign textAlign = TextAlign.left,
    Color? color}) {
  return _getAppTextView(text,
      textStyle:
          getRegularStyle(color: color ?? Colors.black, fontSize: fontSize),
      textAlign: textAlign);
}

Text getAppMediumTextView(String text,
    {required BuildContext context,
    double fontSize = 14,
    TextAlign textAlign = TextAlign.left,
    Color? color}) {
  return _getAppTextView(text,
      textStyle:
          getMediumStyle(color: color ?? Colors.black, fontSize: fontSize),
      textAlign: textAlign);
}

Text getAppBoldTextView(String text,
    {required BuildContext context,
    double fontSize = 14,
    TextAlign textAlign = TextAlign.left,
    Color? color}) {
  return _getAppTextView(text,
      textStyle: getBoldStyle(color: color ?? Colors.black, fontSize: fontSize),
      textAlign: textAlign);
}

Text getAppLightTextView(String text,
    {required BuildContext context,
    double fontSize = 14,
    TextAlign textAlign = TextAlign.left,
    Color? color}) {
  return _getAppTextView(text,
      textStyle:
          getLightStyle(color: color ?? Colors.black, fontSize: fontSize),
      textAlign: textAlign);
}
