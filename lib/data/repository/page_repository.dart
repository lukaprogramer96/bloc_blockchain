// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

import '../../models/pages_model/pages_model.dart';
import '../remote/page_client.dart';

class PageRepository {
  static Future<PagesModel?> getPage() async {
    PagesModel? onePage;
    PageClient pageClient = PageClient(Dio());
    await pageClient.getPage(2).then((response) {
      onePage = response;
    }).onError((error, stackTrace) {});
    return onePage;
  }
}
