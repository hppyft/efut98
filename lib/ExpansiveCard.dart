import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class _ExpansiveCardState extends State<ExpansiveCard> {
  _ExpansiveCardState({@required this.times, @required this.onPressed});

  GestureTapCallback onPressed;
  int times;
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
      return ExpansiveCard(
        times: 5,
        onPressed: onPressed,
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
                    Image.asset('assets/images/brazil.png'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 8.0),
                      child: Text(
                        "Brasil",
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                    Expanded(
                        child: Padding(padding: const EdgeInsets.all(1.0))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 8.0),
                      child: Text(
                        "$times times",
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

class ExpansiveCard extends StatefulWidget {
  ExpansiveCard({@required this.times, @required this.onPressed});

  final GestureTapCallback onPressed;
  final int times;

  @override
  _ExpansiveCardState createState() =>
      _ExpansiveCardState(times: times, onPressed: onPressed);
}
