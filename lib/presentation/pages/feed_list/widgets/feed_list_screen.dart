import 'package:flutter/material.dart';

import 'package:konnect/core/screen/base_page_screen_state.dart';
import 'package:konnect/core/screen/base_screen.dart';
import 'package:konnect/domain/entities/feed.dart';
import 'package:konnect/presentation/manager/assets_manager.dart';
import 'package:konnect/presentation/manager/font_manager.dart';
import 'package:konnect/presentation/manager/styles_manager.dart';
import 'package:konnect/presentation/pages/feed_list/widgets/feed_like_comment_widget.dart';
import 'package:konnect/presentation/pages/feed_list/widgets/feed_like_count.dart';
import 'package:konnect/presentation/pages/feed_list/widgets/feed_user_widget.dart';
import 'package:konnect/presentation/widgets/app_text.dart';
import 'package:konnect/presentation/widgets/text_view.dart';

class FeedListScreen extends BasePageScreen {
  List<FeedData> feedList;
  FeedListScreen(this.feedList);
  @override
  _FeedListScreenState createState() => _FeedListScreenState();
}

class _FeedListScreenState extends BasePageScreenState<FeedListScreen>
    with BaseScreen {
  @override
  void initState() {
    isAppBar = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget body() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          // height: height - 200,
          color: Colors.white,
          child: Column(children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: getTextView("Discussion Forum",
                    getBoldStyle(color: Colors.black, fontSize: FontSize.s14)),
              ),
            ),
            if (widget.feedList.isEmpty) ...{
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: getAppRegularTextView("No Feed, please try again",
                        fontSize: FontSize.s14, context: context),
                  ))
            } else
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.feedList.length,
                  // itemCount: widget.transactionHistoryResponse.transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    FeedData item = widget.feedList.elementAt(index);
                    return Container(
                      decoration: const BoxDecoration(
                          // color: ColorManager.blueBgColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Column(
                                children: [
                                  FeedUserWidget(item: item, width: width),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20),
                                    child: getAppRegularTextView(
                                        item.postContent ?? "",
                                        context: context,
                                        color: Colors.grey.shade900,
                                        fontSize: FontSize.s10),
                                  ),
                                  FeedLikeCountWidget(item: item, width: width),
                                  Divider(
                                    indent: 15,
                                    endIndent: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                  LikeCommentWidget(width: width),
                                ],
                              )),
                          Divider(
                            color: Colors.grey.shade300,
                            thickness: 5,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
          ]),
        ),
      ),
    );
  }

  @override
  String appBarTitle() {
    return "Konnect";
  }

  @override
  BuildContext getContext() {
    return context;
  }
}
