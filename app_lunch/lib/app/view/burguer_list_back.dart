
import 'package:app_lunch/app/domain/entities/hamburguer.dart';
import 'package:app_lunch/app/domain/services/hamburguer_service.dart';
import 'package:app_lunch/app/myApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'burguer_list_back.g.dart';

class BurguerListBack = _BurguerListBack with _$BurguerListBack; 

abstract class _BurguerListBack with Store{
  
  var _service= GetIt.I<HamburguerService>();

  //lista para cardapio
  @observable
  Future<List<Hamburguer>> card;
  
  
  //método para atualizar o cardapio
  @action
  refreshList([dynamic value]){
    card = _service.find();
  }

  _BurguerListBack(){
    refreshList();
  }
  
  //método para chamar o form e salvar
  goToForm(BuildContext context, [Hamburguer hamburguer]){
    Navigator.of(context).pushNamed(MyApp.BURGUER_FORM, arguments: hamburguer).then(refreshList);
  }
  //excluir
  deleteBurguer(int id){
    _service.remove(id);
    refreshList();
  }

}
