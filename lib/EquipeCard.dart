import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/Model.dart';

class _EquipeCardState extends State<EquipeCard> {
  _EquipeCardState({@required this.equipe, @required this.onPressed});

  GestureTapCallback onPressed;
  SelectableEquipe equipe;

  @override
  Widget build(BuildContext context) {
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
                    Image.asset(equipe.flagPath, width: 24, height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 8.0),
                      child: Text(
                        equipe.name,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                    Expanded(
                        child: Padding(padding: const EdgeInsets.all(1.0))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EquipeCard extends StatefulWidget {
  EquipeCard({@required this.equipe, @required this.onPressed});

  final GestureTapCallback onPressed;
  final SelectableEquipe equipe;

  @override
  _EquipeCardState createState() =>
      _EquipeCardState(equipe: equipe, onPressed: onPressed);
}
