import 'package:desafio_dart_avancado/models/estado.dart';
import 'package:dio/dio.dart';

class EstadosRepository {
  Future<List<Estado>> buscaEstados() async {
    var dio = Dio();
    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      var respData = response.data;

      return respData.map<Estado>((e) => Estado.fromMap(e)).toList()
          as List<Estado>;
    }
  }
}
