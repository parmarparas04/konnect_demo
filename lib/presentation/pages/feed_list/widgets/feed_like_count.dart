import 'package:flutter/material.dart';
import 'package:konnect/domain/entities/feed.dart';
import 'package:konnect/presentation/manager/assets_manager.dart';
import 'package:konnect/presentation/manager/font_manager.dart';
import 'package:konnect/presentation/widgets/app_text.dart';

class FeedLikeCountWidget extends StatelessWidget {
  const FeedLikeCountWidget({
    super.key,
    required this.item,
    required this.width,
  });

  final FeedData item;
  final double width;

  @override
  Widget build(BuildContext context) {
    var commentCount = item.comments?.length ?? 0;
    var likeCount = item.likeCount ?? 0;

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
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * .75,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(ImageAssets.like_icon),
                        ),
                        const SizedBox(width: 5),
                        getAppBoldTextView(likeCount.toString(),
                            context: context,
                            color: Colors.grey.shade900,
                            fontSize: FontSize.s12),
                      ],
                    ),
                  ),
                  getAppBoldTextView("$commentCount Comment",
                      context: context,
                      color: Colors.grey.shade900,
                      fontSize: FontSize.s10),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
