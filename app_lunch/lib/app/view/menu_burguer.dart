import 'package:app_lunch/app/MyApp.dart';
import 'package:flutter/material.dart';

class MenuBurguer extends StatelessWidget {
  final cardapio =[
    {'Nome':"CheeseBurguer", 'Descricao':"Pão, Hamburguer 250g, Queijo duplo", 'Valor':"8,00", 'Icon':"https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg"},
    {'Nome':"Burguer Duplo", 'Descricao':"Pão, 2 Hamburguer 250g, Queijo, Presunto, Cheedar", 'Valor':"12,00", 'Icon':"https://cdn.pixabay.com/photo/2020/11/08/01/44/burger-5722678_960_720.jpg"},
    {'Nome':"Burguer c/ bacon", 'Descricao':"Pão, Hamburguer 250g, Queijo duplo, 2 tiras de Bacon, Presunto", 'Valor':"15,00", 'Icon':"https://cdn.pixabay.com/photo/2015/04/20/13/25/burgers-731298_960_720.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
        actions:[
          IconButton(
            icon: Icon(Icons.add), 
              onPressed:(){
                Navigator.of(context).pushNamed(MyApp.BURGUER_FORM);
              },
          )
        ],
        ),
      body: ListView.builder(
        itemCount: cardapio.length,
        itemBuilder: (context,i){
          var hamburguer = cardapio[i];
          var icon = CircleAvatar(backgroundImage: NetworkImage(hamburguer['Icon']),);
          return ListTile(
            leading: icon,
            title: Text(hamburguer['Nome']),
            subtitle: Text(hamburguer['Valor']),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.edit), onPressed: null),
                  IconButton(icon: Icon(Icons.delete), onPressed: null),
                ],
              )
            ),
          );
        },
      ),
    );
  }
}

