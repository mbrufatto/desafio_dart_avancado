import 'package:mysql1/mysql1.dart';

class Estado {
  int id;
  String sigla;
  String nome;

  Estado({this.id, this.sigla, this.nome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }

  static Estado fromMap(Map<String, dynamic> estado) {
    return Estado(
      id: estado['id'],
      sigla: estado['sigla'],
      nome: estado['nome'],
    );
  }

  static Estado fromDataBaseResult(Row row) {
    return Estado(
      id: row[0],
      sigla: row[1],
      nome: row[2],
    );
  }
}
