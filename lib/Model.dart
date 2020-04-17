import 'package:flutter/material.dart';

class SelectableEquipe extends DefaultSelectable {
  SelectableEquipe({String flagPath, String name}) : super(flagPath, name);
}

class SelectablePais extends DefaultSelectable {
  SelectablePais({String flagPath, String name, this.equipeList})
      : super(flagPath, name);

  List<SelectableEquipe> equipeList;
}

class DefaultSelectable {
  DefaultSelectable(this.flagPath, this.name);

  String flagPath;
  String name;
}
