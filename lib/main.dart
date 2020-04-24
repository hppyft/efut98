import 'package:flutter/material.dart';
import 'package:flutterapp/Model.dart';
import 'PaisExpansiveCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoronaFut',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Seleção de times'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _equipes_counter = 0;
  int _paises_counter = 0;

  void _modifyEquipesCounter(int mod) {
    setState(() {
      _equipes_counter += mod;
    });
  }

  void _modifyPaisesCounter(int mod) {
    setState(() {
      _paises_counter += mod;
    });
  }

  @override
  Widget build(BuildContext context) {
    //TODO retirar dummy data
    SelectableEquipe equipe = SelectableEquipe(
        name: 'Flamengo',
        flagPath: 'assets/images/flamengo_flag.png',
        selected: false);
    SelectableEquipe equipe2 = SelectableEquipe(
        name: 'Flamengo',
        flagPath: 'assets/images/flamengo_flag.png',
        selected: false);
    SelectableEquipe equipe3 = SelectableEquipe(
        name: 'Flamengo',
        flagPath: 'assets/images/flamengo_flag.png',
        selected: false);
    SelectablePais brasil = SelectablePais(
        flagPath: 'assets/images/brazil.png',
        name: 'Brasil',
        equipeList: [equipe, equipe2],
        selected: false);
    SelectablePais brasil2 = SelectablePais(
        flagPath: 'assets/images/brazil.png',
        name: 'Brasil',
        equipeList: [equipe3],
        selected: false);
    List<SelectablePais> paises = [brasil, brasil2];

    ListView listView = ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, position) {
        return PaisExpansiveCard(
          pais: paises[position],
          equipesCallback: _modifyEquipesCounter,
          paisesCallback: _modifyPaisesCounter,
        );
      },
      itemCount: paises.length,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Equipes selecionadas: $_equipes_counter',
                style: Theme.of(context).textTheme.body1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Países selecionados: $_paises_counter',
                style: Theme.of(context).textTheme.body1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: SizedBox(width: double.infinity, child: listView),
          )
        ],
      ),
    );
  }
}
