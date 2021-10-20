import 'package:app_lunch/app/MyApp.dart';
import 'package:app_lunch/app/domain/entities/hamburguer.dart';
import 'package:app_lunch/app/view/burguer_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MenuBurguer extends StatelessWidget {
  final _back = BurguerListBack();

  CircleAvatar circleAvatar(String url){
    try{
      return CircleAvatar(backgroundImage: NetworkImage(url));
    }catch(e){
      return CircleAvatar(child: Icon(Icons.food_bank));
    }
  }

  Widget editButton(Function onPressed){
    return IconButton(icon: Icon(Icons.edit), color: Colors.yellow, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context,Function remove){
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.blue,
      onPressed: (){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Excluir'),
            content: Text('Você tem certeza que deseja excluir este item?'),
            actions: [
              FlatButton(
                child: Text('Não'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Sim'),
                onPressed: remove,
              ),
            ],
          )
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cardápio'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.BURGUER_FORM);
              },
            )
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.card,
              builder: (context, futuro) {
                if (futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Hamburguer> cardapio = futuro.data;
                  return ListView.builder(
                    itemCount: cardapio.length,
                    itemBuilder: (context, i) {
                      var hamburguer = cardapio[i];
                      return ListTile(
                        leading: circleAvatar(hamburguer.url_icon),
                        title: Text(hamburguer.nome),
                        subtitle: Text(hamburguer.descricao),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              editButton((){
                                _back.goToForm(context, hamburguer);
                              }),
                              iconRemoveButton(context, (){
                                _back.deleteBurguer(hamburguer.id);
                                Navigator.of(context).pop();
                              })
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
