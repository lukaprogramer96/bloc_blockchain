import 'dart:convert';

import 'package:http/http.dart';

import '../models/coin_model/coin_model.dart';
import '../models/exchanges_model/exchanges_model.dart';
import '../models/twitter_model/twitter_model.dart';
import '../models/user_model/user_model.dart';

class CryptoRepository {
  // String endpoint = 'https://api.coinpaprika.com/v1/coins';
  // Future<List<CryptoModel>> getCryptos() async {
  //   Response response = await get(Uri.parse(endpoint));
  //   if (response.statusCode >= 200 && response.statusCode <= 299) {
  //     final List result = jsonDecode(response.body);
  //     return result.map(((e) => CryptoModel.fromJson(e))).toList();
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }

  Future<CoinModel?> getCoin(id) async {
    String endpoint = 'https://api.coinpaprika.com/v1/coins/$id';
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final Map<String, dynamic>? result = jsonDecode(response.body);
      if (result == null) {
        return null;
      }
      return CoinModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<TwitterModel>> getTwitterByCoinId(coinId) async {
    String endpoint = 'https://api.coinpaprika.com/v1/coins/$coinId/twitter';
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => TwitterModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<ExchangesModel>> getExchanges() async {
    String endpoint = 'https://api.coinpaprika.com/v1/exchanges';
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => ExchangesModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<UserModel>> getUsers() async {
    String endpoint = 'https://reqres.in/api/users?page=2';
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
