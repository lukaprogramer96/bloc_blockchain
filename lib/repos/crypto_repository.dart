import 'dart:convert';

import 'package:http/http.dart';

import '../models/coin_model.dart';
import '../models/crypto_model.dart';

class CryptoRepository {
  String endpoint = 'https://api.coinpaprika.com/v1/coins';
  Future<List<CryptoModel>> getCryptos() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => CryptoModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

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
}
