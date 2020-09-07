import 'package:carros/pages/carro/carro.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    /*
    // A outra maneira de fazer tratamento do erro é no snapshot do FutureBuilder, ao invés de usar o try..catch aqui no método API.
    try {
    */
    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros';

    print("GET > $url");

    var response = await http.get(url);

    String json = response.body;
    print(json);

    List list = convert.json.decode(json);

    /*
    // Map manual com for().
    final carros = List<Carro>();

    for (Map map in list) {
      Carro c = Carro.fromJson(map);
      carros.add(c);
    }
    */

    /*
    final carros = list.map<Carro>((map) {
      return Carro.fromJson(map);
    }).toList();
    */

    final carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();

    return carros;
    /*
    } catch (error) {
      print(error);
    }
    */
  }
}