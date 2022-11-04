// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

import 'package:bloc_reso_coder/models/coin_model/coin_model.dart';

import '../../models/crypto_model/crypto_model.dart';
import '../remote/crypto_client.dart';

class CryptoRepository {
  static Future<List<CryptoModel>?> getCryptos() async {
    List<CryptoModel>? cryptoList;
    CryptoClient cryptoClient = CryptoClient(Dio());
    await cryptoClient.getCryptos().then((response) {
      cryptoList = response;
    }).onError((error, stackTrace) {});
    return cryptoList;
  }

  static Future<CoinModel?> getCoin(String coinId) async {
    CoinModel? coinModel;
    CryptoClient cryptoClient = CryptoClient(Dio());
    await cryptoClient.getCoin(coinId).then((response) {
      coinModel = response;
    }).onError((error, stackTrace) {});
    return coinModel;
  }
}
