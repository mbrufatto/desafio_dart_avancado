import 'package:desafio_dart_avancado/models/cidade.dart';
import 'package:desafio_dart_avancado/models/estado.dart';
import 'package:mysql1/mysql1.dart';

class Database {
  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'root',
        db: 'desafio_dart_avancado');
    return await MySqlConnection.connect(settings);
  }

  Future<void> cadastrarEstado(Estado estado) async {
    var conn = await getConnection();
    var existeEstadoCad = await _existeEstado(estado.id, conn);

    if (!existeEstadoCad) {
      await conn.query('insert into estados(id, sigla, nome) values(?,?,?)',
          [estado.id, estado.sigla, estado.nome]);
    }
    await conn.close();
  }

  Future<void> cadastraEstadoCidade(int estadoId, int cidadeId) async {
    var conn = await getConnection();
    var existeVinculo =
        await _existeVinculoDeEstadoCidade(estadoId, cidadeId, conn);
    if (!existeVinculo) {
      await conn.query(
          'insert into estado_cidade(id_estado, id_cidade) values(?,?)',
          [estadoId, cidadeId]);
    }
    await conn.close();
  }

  Future<void> cadastrarCidade(Cidade cidade) async {
    var conn = await getConnection();
    var existeCidadeCad = await _existeCidade(cidade.id, conn);

    if (!existeCidadeCad) {
      await conn.query('insert into cidades(id, nome) values(?,?)',
          [cidade.id, cidade.nome]);
    }
    await conn.close();
  }

  Future<List<Estado>> getEstados() async {
    var conn = await getConnection();

    var results = await conn.query('select id, sigla, nome from estados');
    await conn.close();

    return results.map<Estado>((e) => Estado.fromDataBaseResult(e)).toList()
        as List<Estado>;
  }

  Future<List<Cidade>> buscaCidadesPeloIdDoEstado(int estadoId) async {
    var conn = await getConnection();

    var results = await conn.query('''
                    Select c.nome from cidades c
                      inner join estado_cidade ec on ec.id_cidade = c.id
                    where ec.id_estado = $estadoId order by c.nome asc; ''');
    await conn.close();
    return results.map<Cidade>((c) => Cidade.fromDataBaseResult(c)).toList();
  }

  Future<bool> _existeEstado(int estadoId, MySqlConnection conn) async {
    var resultado = await conn
        .query('select count(id) from estados where id = ?', [estadoId]);
    if (resultado.first[0] > 0) {
      return true;
    }
    return false;
  }

  Future<bool> _existeCidade(int cidadeId, MySqlConnection conn) async {
    var resultado = await conn
        .query('select count(id) from cidades where id = ?', [cidadeId]);
    if (resultado.first[0] > 0) {
      return true;
    }
    return false;
  }

  Future<bool> _existeVinculoDeEstadoCidade(
      int estadoId, cidadeId, MySqlConnection conn) async {
    var resultado = await conn.query(
        'select count(id_cidade) from estado_cidade where id_cidade = ? and id_estado = ?',
        [cidadeId, estadoId]);
    if (resultado.first[0] > 0) {
      return true;
    }
    return false;
  }
}
