import 'package:konnect/core/page/base_page.dart';
import 'package:konnect/injection_container.dart';
import 'package:konnect/presentation/pages/feed_list/bloc/event.dart';
import 'package:konnect/presentation/pages/feed_list/bloc/state.dart';
import 'package:konnect/presentation/pages/feed_list/widgets/feed_list_screen.dart';

import 'bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedListPage extends BasePage<FeedListPage, FeedListBloc> {
  String phone = "";

  // SendMoneyScreen({required this.contact});
  // final Function moveToSecTab;
  // FeedListPage(this.ncontext, {required this.sendMoneySuccess});

  @override
  Widget getBody() {
    return BlocProvider(
      create: (context) => bloc
        ..add(const FeedListEvent(assetPath: 'assets/json/feed_mock.json')),
      child: BlocConsumer<FeedListBloc, FeedListState>(
          listenWhen: (previous, current) {
        return true;
      }, listener: (context, state) {
        if (state is FeedListLoadingState) {
          // loadingOverlay.show(context);
        }
        if (state is FeedListLoadedState) {
          // loadingOverlay.hide();
        }
        if (state is FeedListErrorState) {
          // loadingOverlay.hide();
          showInSnackBar(context, state.message);
        }
      }, builder: (ctx, state) {
        if (state is FeedListLoadedState) {
          return FeedListScreen(state.data);
        } else {
          return Text("state.data");
        }
      }),
    );
  }

  showInSnackBar(BuildContext cxt, String value) {
    Widget okButton = TextButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.of(cxt, rootNavigator: true).pop('dialog');
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(children: [
        Icon(
          Icons.error,
          color: Colors.red.shade700,
        ),
        Text('  Please check ')
      ]),
      content: Text(value),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: cxt,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  AppBar? getBar() {
    return null;
  }

  @override
  FeedListBloc getBLoc(BuildContext context) => instance<FeedListBloc>();
}
