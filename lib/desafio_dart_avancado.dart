import 'package:desafio_dart_avancado/database/database.dart';
import 'package:desafio_dart_avancado/models/estado.dart';
import 'package:desafio_dart_avancado/repository/cidade_repository.dart';
import 'package:desafio_dart_avancado/repository/estados_repository.dart';
import 'dart:io';
import 'models/cidade.dart';

Future<void> run() async {
  // await populaBancoDeDados();
  await mostraListaDeEstados();
  print('');
  print('');
  await escolheUmEstado();
}

Future<void> populaBancoDeDados() async {
  var estados = await EstadosRepository().buscaEstados();

  print('------------------ Iniciando Cadastro ------------------------------');

  for (Estado estado in estados) {
    await Database().cadastrarEstado(estado);
    var cidades = await CidadeRepository().buscaCidadePeloEstadoId(estado.id);
    print('------- Cadastrando cidades do estado ${estado.nome}');
    for (Cidade cidade in cidades) {
      await Database().cadastrarCidade(cidade);
      await Database().cadastraEstadoCidade(estado.id, cidade.id);
    }
  }

  print('------------------ Cadastro Finalizado -----------------------------');
}

Future<void> mostraListaDeEstados() async {
  var results = await Database().getEstados();
  print(
      ' ----------------------------------------------------------------------------------------------------------------------------------------------------------');
  print(
      '| Codigo do Estado       | Sigla         | Nome do Estado                                                                                                  |');
  print(
      ' ----------------------------------------------------------------------------------------------------------------------------------------------------------');
  results.forEach((estado) {
    print(
        '| ${estado.id}                     | ${estado.sigla}            | ${estado.nome}     ');
    print(
        '|----------------------------------------------------------------------------------------------------------------------------------------------------------|');
  });
}

Future<void> mostraCidadesPeloIdDoEstado(int estadoId) async {
  var results = await Database().buscaCidadesPeloIdDoEstado(estadoId);
  print(
      ' --------------------------------------------------------------------');
  print(
      '| Cidade                                                             |');
  print(
      ' --------------------------------------------------------------------');

  results.forEach((cidade) {
    print('| ${cidade.nome} ');
    print(
        ' --------------------------------------------------------------------');
  });
  await escolheNovoEstado();
}

Future<void> escolheUmEstado() async {
  stdout.write('Digite o código de um estado para visualizar as cidade:');
  var codigoEstado = int.tryParse(stdin.readLineSync());
  await mostraCidadesPeloIdDoEstado(codigoEstado);
}

Future<void> escolheNovoEstado() async {
  stdout.write('Deseja ver as cidades de outro estado( S / N):');
  var opcao = stdin.readLineSync();
  if (opcao == 'S' || opcao == 's') {
    await mostraListaDeEstados();
    stdout.write('Digite o código de um estado para visualizar as cidade:');
    var codigoEstado = int.tryParse(stdin.readLineSync());
    await mostraCidadesPeloIdDoEstado(codigoEstado);
  } else {
    return;
  }
}
