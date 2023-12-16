import 'package:konnect/core/page/base_page.dart';
import 'package:konnect/injection_container.dart';
import 'package:konnect/presentation/manager/assets_manager.dart';
import 'package:konnect/presentation/pages/home/bloc/event.dart';
import 'package:konnect/presentation/pages/home/bloc/state.dart';
import 'package:konnect/presentation/pages/home/widgets/home_screen.dart';
import 'package:konnect/presentation/widgets/loading_overlay.dart';

import 'bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends BasePage<HomePage, HomeBloc> {
  LoadingOverlay loadingOverlay = LoadingOverlay();

  @override
  Widget getBody() {
    return BlocProvider(
      create: (context) =>
          bloc..add(const HomeEvent(assetPath: HOME_JSON_PATH)),
      child: BlocConsumer<HomeBloc, HomeState>(listenWhen: (previous, current) {
        return true;
      }, listener: (context, state) {
        if (state is HomeLoadingState) {
          loadingOverlay.show(context);
        }
        if (state is HomeLoadedState) {
          loadingOverlay.hide();
        }
        if (state is HomeErrorState) {
          loadingOverlay.hide();
          showInSnackBar(context, state.message);
        }
      }, builder: (ctx, state) {
        if (state is HomeLoadedState) {
          return HomeScreen(state.data);
        } else {
          return const Text("No Data found");
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
  HomeBloc getBLoc(BuildContext context) => instance<HomeBloc>();
}
