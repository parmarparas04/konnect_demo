import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BasePage<T extends BasePage<T, B>, B extends Bloc>
    extends StatefulWidget {
  BuildContext? context;

  Widget getBody();
  // LoadingOverlay loadingOverlay = LoadingOverlay();

  String? barTile;

  B get bloc {
    return _bloc;
  }

  B getBLoc(BuildContext context);

  late B _bloc;

  void onCreate() {}

  void onDestroy() {}

  AppBar? getBar();
  @override
  Widget build(BuildContext context) {
    AppBar? myAppBar = getBar();
    print("object ${myAppBar == null}");
    return myAppBar == null
        ? Scaffold(
            body: getBody(),
          )
        : Scaffold(
            appBar: myAppBar,
            body: getBody(),
          );
  }

  @override
  State createState() => _BasePageState<T, B>();
}

class _BasePageState<T extends BasePage<T, B>, B extends Bloc>
    extends State<T> {
  @override
  void initState() {
    super.initState();
    widget.context = context;
    widget._bloc = widget.getBLoc(context);
    widget.onCreate();
  }

  @override
  void dispose() {
    widget.onDestroy();
    // if (DialogManager().isShowDialog == true) {
    //   DialogManager().hideDialog(context);
    // }
    widget.bloc.close();

    // widget._bloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    widget.context = context;
    return widget.build(context);
  }
}
