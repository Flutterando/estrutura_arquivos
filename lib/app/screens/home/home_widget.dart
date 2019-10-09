import 'package:aula_blocpattern/app/app_module.dart';
import 'package:aula_blocpattern/app/shared/models/pokemon_model.dart';
import 'package:flutter/material.dart';

import '../../app_bloc.dart';
import 'components/custom_drawer.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {


  List<Pokemon> listPokemons = [
    Pokemon(name: "Charmander"),
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charizard"),
    Pokemon(name: "Bubasaur"),
    Pokemon(name: "MewTwo"),
  ];

  Widget _buildList() {
    return ListView.separated(
      itemCount: listPokemons.length,
      itemBuilder: (context, index) {
        return _buildItem(listPokemons[index]);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget _buildItem(Pokemon model) {
    return ListTile(
      title: Text(model.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text("Pokemon"),
          actions: <Widget>[
            IconButton(
              onPressed: (){
                 AppModule.to.bloc<AppBloc>().changeTheme();   
              },
              icon: Icon(Icons.add_shopping_cart),

            )
          ],
        ),
        body: _buildList());
  }
}
