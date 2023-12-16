import 'package:flutter/services.dart';

import '../../binding/binding_datasource.dart';

abstract class BindingLocal implements BindingDataSource {
  Future<String> getJsonStringFromAsset(String path);
}

class BindingLocalImpl implements BindingLocal {
  BindingLocalImpl();
  @override
  Future<String> getJsonStringFromAsset(String path) async {
    final String response = await rootBundle.loadString(path);
    return response;
  }
}
