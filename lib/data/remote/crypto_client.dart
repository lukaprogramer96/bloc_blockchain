// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

import '../../models/coin_model/coin_model.dart';
import '../../models/crypto_model/crypto_model.dart';
import '../../models/exchanges_model/exchanges_model.dart';
import '../../models/twitter_model/twitter_model.dart';
import '../../models/user_model/user_model.dart';

part 'crypto_client.g.dart';

@RestApi(baseUrl: 'https://api.coinpaprika.com')
abstract class CryptoClient {
  factory CryptoClient(Dio dio, {String baseUrl}) = _CryptoClient;

  @GET('/v1/coins')
  Future<List<CryptoModel>?> getCryptos();

  @GET('v1/coins/{id}')
  Future<CoinModel> getCoin(
    @Path('id') String coinId,
  );

  @GET('/v1/coins/{coinId}/twitter')
  Future<TwitterModel> getTwitterByCoinId(
    @Path('coinId') String twitterCoinId,
  );

  @GET('/v1/exchanges')
  Future<ExchangesModel>? getExchanges();

  @GET('/v1/exchanges')
  Future<UserModel> getUsers();
}
