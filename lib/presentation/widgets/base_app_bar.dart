import 'package:flutter/material.dart';
import 'package:konnect/presentation/manager/font_manager.dart';
import 'package:konnect/presentation/manager/styles_manager.dart';
import 'package:konnect/presentation/widgets/text_view.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;

  final Widget title;
  final List<Widget>? widgets;
  final AppBar appBar;
  final Widget? leading;

  /// you can add more fields that meet your needs

  const BaseAppBar({
    Key? key,
    required this.title,
    this.widgets,
    this.leading,
    this.backgroundColor,
    required this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (leading != null) {
      return AppBar(
        centerTitle: false,
        leading: leading,
        title: Row(
          children: [
            widgets![0],
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        shadowColor: backgroundColor,
        actions: widgets,
      );
    } else {
      return AppBar(
        centerTitle: false,
        title: Row(
          children: [
            title,
          ],
        ),
        shadowColor: backgroundColor,
        backgroundColor: backgroundColor,
        actions: widgets,
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
