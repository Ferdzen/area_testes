import 'package:app_lunch/app/MyApp.dart';
import 'package:app_lunch/app/database/sqlite/dao/hamburguer_dao_impl.dart';
import 'package:app_lunch/app/domain/entities/hamburguer.dart';
import 'package:flutter/material.dart';

class MenuBurguer extends StatelessWidget {
  
  Future<List<Hamburguer>> _buscar() async {
    return HamburguerDAOImpl().find();

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<Hamburguer> cardapio = futuro.data;
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
              body: ListView.builder(
                itemCount: cardapio.length,
                itemBuilder: (context, i) {
                  var hamburguer = cardapio[i];
                  var icon = CircleAvatar(
                    backgroundImage: NetworkImage(hamburguer.url_icon),
                  );
                  return ListTile(
                    leading: icon,
                    title: Text(hamburguer.nome),
                    subtitle: Text(hamburguer.descricao),
                    trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: null),
                            IconButton(
                                icon: Icon(Icons.delete), onPressed: null),
                          ],
                        )),
                  );
                },
              ),
            );
          } else {
            return Scaffold();
          }
        });
  }
}
