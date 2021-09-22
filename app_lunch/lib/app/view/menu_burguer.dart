import 'package:app_lunch/app/MyApp.dart';
import 'package:app_lunch/app/database/sqlite/connection.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class MenuBurguer extends StatelessWidget {
  
  Future<List<Map<String, dynamic>>> _buscar() async {
    Database db = await Connection.get();
    return db.query('cardapio');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            var cardapio = futuro.data;

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
                    backgroundImage: NetworkImage(hamburguer['url_icon']),
                  );
                  return ListTile(
                    leading: icon,
                    title: Text(hamburguer['nome']),
                    subtitle: Text(hamburguer['valor']),
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
