import 'package:flutter/material.dart';
import 'package:konnect/presentation/manager/assets_manager.dart';
import 'package:konnect/presentation/manager/font_manager.dart';
import 'package:konnect/presentation/widgets/app_text.dart';

class LikeCommentWidget extends StatelessWidget {
  const LikeCommentWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5),
            child: SizedBox(
                width: width * .45,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(ImageAssets.like_white_icon),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      getAppRegularTextView("Like",
                          context: context,
                          color: Colors.grey.shade900,
                          fontSize: FontSize.s10),
                    ],
                  ),
                )),
          ),
          VerticalDivider(
            color: Colors.grey.shade500,
            width: .5,
            thickness: .5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 15),
            child: SizedBox(
                width: width * .45,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(ImageAssets.comment_icon),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      getAppRegularTextView("Comment",
                          context: context,
                          color: Colors.grey.shade900,
                          fontSize: FontSize.s10),
                    ],
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
