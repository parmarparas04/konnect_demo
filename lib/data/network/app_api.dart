
import 'package:dio/dio.dart';
import 'package:konnect/data/models/feed.dart';
import 'package:retrofit/http.dart';


part 'app_api.g.dart';

// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
                    
@RestApi(baseUrl: "https://www.demo.com")
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @GET("/")
  Future<FeedResponse> getFeed();

}
