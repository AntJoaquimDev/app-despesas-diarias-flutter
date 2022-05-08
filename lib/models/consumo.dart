import 'dart:io';

void main(List<String> args) {
  print('Qual o comprimento da pista ? ');
  double compPista = double.parse(stdin.readLineSync().toString());

  print('Quantidade de voltas');
  double qtdVoltas = double.parse(stdin.readLineSync().toString());

  print('Numero de abastecimentos');
  double numAbastecimentos = double.parse(stdin.readLineSync().toString());

  print('Consumo de combustivel');
  double consCombustivel = double.parse(stdin.readLineSync().toString());

  double consMedio = compPista / consCombustivel;
  print(consMedio);
}
