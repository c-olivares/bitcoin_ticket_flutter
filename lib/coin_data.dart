import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String requestURL =
        'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=C2964A1D-3225-4D9A-B2FB-100C4E6BD86A';
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      double selectedCurrency = jsonResponse['rate'] as double;
      return selectedCurrency.toStringAsFixed(0);
    } else {
      print(response.statusCode);
    }
  }
}
