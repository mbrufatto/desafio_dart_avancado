import 'package:mysql1/mysql1.dart';

class Cidade {
  int id;
  String nome;

  Cidade({
    this.id,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: map['id'],
      nome: map['nome'],
    );
  }

  static Cidade fromDataBaseResult(Row row) {
    return Cidade(
      nome: row[0],
    );
  }
}
