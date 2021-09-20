
/*
Programação assíncrona: permite carregar as funções mais rápidas ao mesmo tempo que a função mais pesada é
executada em segundo plano. Assim, a aplicação não fica presa esperando que a função mais pesada termine para
executar as outras.
Future: classe que nos permite que algo seja executado no futuro, isto é, que uma função levará certo tempo
para ser executada.
Async e await: com async, sinalizamos que em algum momento será preciso aguardar a conclusão de uma tarefa para
prosseguir com a execução. Com await, pedimos para que se aguarde até que a função termine para continuar.
*/

import 'dart:io';

void main() async{

miar();
latir();
await chamadoSilencio();
papagaio();

}

miar(){
  print('Miau!');
}

Future latir(){
  return Future.delayed(Duration(seconds: 2), () => print('Au au'));
}

Future chamadoSilencio(){
  return Future.delayed(Duration(seconds: 4), () => print('Silêncio Scooby! Feio!'));

}

papagaio(){
  print('Scooby feio! Scooby feio!');
}