import 'package:desafio_dart_avancado/models/cidade.dart';
import 'package:dio/dio.dart';

class CidadeRepository {
  Future<List<Cidade>> buscaCidadePeloEstadoId(int estadoId) async {
    var dio = Dio();
    var url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$estadoId/distritos';
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      var respData = response.data;

      return respData.map<Cidade>((e) => Cidade.fromMap(e)).toList()
          as List<Cidade>;
    }
  }
}
