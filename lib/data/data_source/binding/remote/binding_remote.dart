import 'package:konnect/data/models/feed.dart';
import 'package:konnect/data/network/app_api.dart';

import '../../../network/network_info.dart';
import '../../binding/binding_datasource.dart';

abstract class BindingRemote implements BindingDataSource {
  Future<FeedResponse> getFeed();
  Future<bool> isConnected();
}

class BindingRemoteImpl implements BindingRemote {
  final AppServiceClient _appServiceClient;
  final NetworkInfo _networkInfo;
  BindingRemoteImpl(this._appServiceClient, this._networkInfo);

  @override
  Future<FeedResponse> getFeed() async {
    return await _appServiceClient.getFeed();
  }

  @override
  Future<bool> isConnected() async {
    return await _networkInfo.isConnected;
  }
}
