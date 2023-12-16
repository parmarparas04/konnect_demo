import 'package:flutter/material.dart';
import 'package:konnect/domain/entities/feed.dart';
import 'package:konnect/presentation/manager/assets_manager.dart';
import 'package:konnect/presentation/manager/font_manager.dart';
import 'package:konnect/presentation/widgets/app_text.dart';

class FeedUserWidget extends StatelessWidget {
  const FeedUserWidget({
    super.key,
    required this.item,
    required this.width,
  });

  final FeedData item;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            // if (phone.isNotEmpty) {
            //   Navigator.pushNamed(
            //       widget.ncontext, Routes.sendMoneyRoute,
            //       arguments: c);
            // }
          },
          title: Row(children: [
            if (item.user != null &&
                item.user!.profilePicture != null &&
                item.user!.profilePicture!.isNotEmpty) ...{
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CircleAvatar(
                    maxRadius: 22,
                    backgroundImage:
                        NetworkImage(item.user?.profilePicture ?? ""),
                    backgroundColor: Colors.transparent,
                  )),
            },
            const SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * .75,
                    child: Row(
                      children: [
                        getAppBoldTextView((item.user?.name ?? ""),
                            context: context,
                            color: Colors.black,
                            fontSize: FontSize.s12),
                        getAppRegularTextView("  . 2h",
                            context: context,
                            color: Colors.grey.shade500,
                            fontSize: FontSize.s10),
                      ],
                    ),
                  ),
                  getAppBoldTextView("VP at Karma Legal and Associates",
                      context: context,
                      color: Colors.grey.shade600,
                      fontSize: FontSize.s8),
                ],
              ),
            ),
            Image(
              image: AssetImage(ImageAssets.three_dot_icon),
            ),
          ]),
        ),
      ],
    );
  }
}
