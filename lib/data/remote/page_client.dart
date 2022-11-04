// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

import '../../models/pages_model/pages_model.dart';

part 'page_client.g.dart';

@RestApi(baseUrl: 'https://reqres.in')
abstract class PageClient {
  factory PageClient(Dio dio, {String baseUrl}) = _PageClient;

  @GET('/api/users')
  Future<PagesModel?> getPage(@Query('page') int page);
}
