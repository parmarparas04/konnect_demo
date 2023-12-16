import 'package:flutter/material.dart';
import 'package:konnect/config/routes/routes.dart';

import 'package:konnect/core/screen/base_page_screen_state.dart';
import 'package:konnect/core/screen/base_screen.dart';
import 'package:konnect/domain/entities/feed.dart';
import 'package:konnect/domain/entities/home.dart';
import 'package:konnect/presentation/manager/font_manager.dart';
import 'package:konnect/presentation/manager/styles_manager.dart';
import 'package:konnect/presentation/widgets/app_text.dart';
import 'package:konnect/presentation/widgets/card_view.dart';

class HomeScreen extends BasePageScreen {
  List<HomeData> homeData;
  HomeScreen(this.homeData);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BasePageScreenState<HomeScreen> with BaseScreen {
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
            const SizedBox(
              height: 20,
            ),
            if (widget.homeData.isEmpty) ...{
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: getAppRegularTextView("No data, please try again",
                        fontSize: FontSize.s14, context: context),
                  ))
            } else
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Column(
                  children: [
                    ListView.builder(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.homeData.length,
                      // itemCount: widget.transactionHistoryResponse.transactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        HomeData item = widget.homeData.elementAt(index);

                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 20),
                          child: getCard(
                            color: Colors.grey.shade50,
                            child: Container(
                              decoration: const BoxDecoration(
                                  // color: ColorManager.blueBgColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    onTap: () {
                                      if (index == 2) {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.feedRoute,
                                        );
                                      }
                                    },
                                    title: Row(children: [
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image: AssetImage(item.icon ?? ""),
                                          )),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width * .50,
                                            child: getAppBoldTextView(
                                                item.title ?? "",
                                                context: context,
                                                color: Colors.black,
                                                fontSize: FontSize.s12),
                                          ),
                                          getAppRegularTextView(
                                              item.subtitle ?? "",
                                              context: context,
                                              color: Colors.grey.shade900,
                                              fontSize: FontSize.s10),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: getAppRegularTextView(
                          "Feel free to share your feedback to improve Konnect or get insights on a specific issue.",
                          context: context,
                          color: Colors.grey.shade900,
                          fontSize: FontSize.s10),
                    ),
                  ],
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
