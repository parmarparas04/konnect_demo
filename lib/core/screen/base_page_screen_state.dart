import 'package:flutter/material.dart';
import 'package:konnect/core/screen/base_screen.dart';
import 'package:konnect/presentation/widgets/app_base_bar_with_icon.dart';

mixin BaseScreen<Page extends BasePageScreen> on BasePageScreenState<Page> {
  bool isAppBar = false;

  @override
  Widget build(BuildContext context) {
    return isAppBar
        ? GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: getBaseAppBar(appBarTitle(), getContext(),
                    isWidgetDisplace: false),
                body: Container(
                  child: body(),
                  color: Colors.white,
                )))
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              child: body(),
              color: Colors.white,
            ));
  }

  Widget body();
}
