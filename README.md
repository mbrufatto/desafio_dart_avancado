# Modulo Dart Avançado do Curso Academia do Flutter

Este projeto tem como objetivo o aprendizado de dart, para poder desenvolver em Flutter.
Para este projeto foram utilizadas as bibliotecas Dio e MySql1, que se encontram no arquivo pubspec.yaml da raiz do projeto.
Este projeto também utiliza o docker para subir um serviço de mysql.

## Instrução

Para executar este projeto é necessário baixar as bibliotecas no primeiro momento da seguinte forma:
1) Abrir o terminal;
2) Navegar até o projeto e rodar o comando dart pub get;
3) Subir o serviço docker de mysql com o comando docker-compose up;
4) Acessar o banco de dados com algum client;
5) Pegar o script de criação do banco na pasta /lib/database/database.sql e executar no client de banco de dados;
6) Voltar ao terminal e acessar a pasta /bin/ do projeto;
7) Executar o comando dart desafio_dart_avancado.dart.

## Breve Descrição

Quando for executado o comando dart desafio_dart_avancado.dart no terminal, será realizado o cadastro de todos os estados e cidades. Após o término do cadastro, será listado todos os estados do Brasil. Abaixo da lista de estados o usuário poderá escolher um estado para exibir as cidades, o usuário deverá digitar o código do estado. Assim, ele poderá ver a lista das cidades por um determinado estado. Após a primeira execução da lista de cidades o usuário poderá ver outras cidades de outros estados se assim desejar, aparecerá uma mensagem perguntando se o usuário quer ver cidades de outro estado ou não, caso o usuário digit 'S' ou 's', será apresentada novamente a lista de estados para que o usuário possa escolher qual estado le quer ver as cidades. Caso o usuário digite 'N' ou 'n' o programa é encerrado.


## Funcionalidades Implementadas

- Busca de estados e cidades da API do IBGE;

- Salva cidades e estados no banco de dados MySql;

- Vincula os estados com as cidades;

- Lista as cidades de um determinado estado;

## Melhorias

- Melhorar o nome dos métodos e variáveis;
- Tratar alguns exceptions;
- Criar testes;

