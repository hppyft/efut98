import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/EquipeCard.dart';
import 'package:flutterapp/Model.dart';

class _PaisExpansiveCardState extends State<PaisExpansiveCard> {
  _PaisExpansiveCardState(
      {@required this.pais,
      @required this.equipesCallback,
      @required this.paisesCallback});

  final void Function(int) equipesCallback;
  final void Function(int) paisesCallback;
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

  void _onPaisClicked() {
    setState(() {
      if (pais.selected) {
        int equipes = pais.deselectAllEquipes();
        equipes = equipes * (-1);
        equipesCallback(equipes);
        paisesCallback(-1);
      } else {
        int equipes = pais.selectAllEquipes();
        equipesCallback(equipes);
        paisesCallback(1);
      }
      pais.selected = !pais.selected;
    });
  }

  void _onEquipeClicked(SelectableEquipe equipe) {
    setState(() {
      if (equipe.selected) {
        if (pais.isAllSelected()) {
          pais.selected = false;
          paisesCallback(-1);
        }
        equipe.selected = !equipe.selected;
        equipesCallback(-1);
      } else{
        equipe.selected = !equipe.selected;
        equipesCallback(1);
        if (pais.isAllSelected()) {
          pais.selected = true;
          paisesCallback(1);
        }
      }
    });
  }

  Widget _expand() {
    if (isExpanded) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, position) {
          return EquipeCard(
            equipe: pais.equipeList[position],
            equipeCallback: _onEquipeClicked,
          );
        },
        itemCount: pais.equipeList.length,
      );
    } else {
      return Padding(padding: EdgeInsets.all(0.0));
    }
  }

  Color _getColor() {
    if (pais.selected) {
      return Colors.green;
    } else {
      return Colors.greenAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = _expand();

    return AnimatedContainer(
      duration: Duration(seconds: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: _getColor(),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          onTap: _onPaisClicked,
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
                    InkWell(
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
  PaisExpansiveCard(
      {@required this.pais,
      @required this.equipesCallback,
      @required this.paisesCallback});

  final void Function(int) equipesCallback;
  final void Function(int) paisesCallback;
  final SelectablePais pais;

  @override
  _PaisExpansiveCardState createState() => _PaisExpansiveCardState(
      pais: pais,
      equipesCallback: equipesCallback,
      paisesCallback: paisesCallback);
}
