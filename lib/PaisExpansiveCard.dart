import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/EquipeCard.dart';
import 'package:flutterapp/Model.dart';

class _PaisExpansiveCardState extends State<PaisExpansiveCard> {
  _PaisExpansiveCardState({@required this.pais, @required this.onPressed});

  GestureTapCallback onPressed;
  SelectablePais pais;
  IconData iconData = Icons.keyboard_arrow_down;
  bool isExpanded = false;

  void _changeExpanded() {
    setState(() {
      if (isExpanded) {
        iconData = Icons.keyboard_arrow_down;
      } else {
        iconData = Icons.keyboard_arrow_up;
      }
      isExpanded = !isExpanded;
    });
  }

  Widget _expand(bool isExpanded, GestureTapCallback onPressed) {
    if (isExpanded) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, position) {
          return EquipeCard(
            equipe: pais.equipeList[position],
            onPressed: onPressed,
          );
        },
        itemCount: pais.equipeList.length,
      );
    } else {
      return Padding(padding: EdgeInsets.all(0.0));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = _expand(isExpanded, onPressed);

    return AnimatedContainer(
      duration: Duration(seconds: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Colors.lightGreenAccent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          onTap: onPressed,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(pais.flagPath),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 8.0),
                      child: Text(
                        pais.name,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                    Expanded(
                        child: Padding(padding: const EdgeInsets.all(1.0))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 8.0),
                      child: Text(
                        "${pais.equipeList.length} times",
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                    GestureDetector(
                      onTap: _changeExpanded,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 8.0),
                        child: Icon(
                          iconData,
                          color: Colors.black,
                          size: 24.0,
                          semanticLabel: 'Seta para mostrar equipes do pais',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              widget
            ],
          ),
        ),
      ),
    );
  }
}

class PaisExpansiveCard extends StatefulWidget {
  PaisExpansiveCard({@required this.pais, @required this.onPressed});

  final GestureTapCallback onPressed;
  final SelectablePais pais;

  @override
  _PaisExpansiveCardState createState() =>
      _PaisExpansiveCardState(pais: pais, onPressed: onPressed);
}
