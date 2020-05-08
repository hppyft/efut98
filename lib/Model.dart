import 'package:tuple/tuple.dart';

class SelectableEquipe extends DefaultSelectable {
  SelectableEquipe({String flagPath, String name, bool selected})
      : super(flagPath, name, selected);
}

class SelectablePais extends DefaultSelectable {
  SelectablePais({String flagPath, String name, bool selected, this.equipeList})
      : super(flagPath, name, selected);

  List<SelectableEquipe> equipeList;

  int selectAllEquipes() {
    int counter = 0;
    equipeList.forEach((SelectableEquipe equipe) {
      if (!equipe.selected) {
        counter++;
        equipe.selected = true;
      }
    });
    return counter;
  }

  int deselectAllEquipes() {
    int counter = 0;
    equipeList.forEach((SelectableEquipe equipe) {
      if (equipe.selected) {
        counter++;
        equipe.selected = false;
      }
    });
    return counter;
  }

  bool isAllSelected() {
    bool isAllSelected = true;
    equipeList.forEach((SelectableEquipe equipe) {
      if (!equipe.selected) {
        isAllSelected = false;
      }
    });
    return isAllSelected;
  }

  List<SelectableEquipe> getAllDeselected(){
    List<SelectableEquipe> deselected = [];
    equipeList.forEach((SelectableEquipe equipe) {
      if (!equipe.selected) {
        deselected.add(equipe);
      }
    });
    return deselected;
  }

  bool isAllDeselected() {
    bool isAllDeselected = true;
    equipeList.forEach((SelectableEquipe equipe) {
      if (equipe.selected) {
        isAllDeselected = false;
      }
    });
    return isAllDeselected;
  }
}

class DefaultSelectable {
  DefaultSelectable(this.flagPath, this.name, this.selected);

  String flagPath;
  String name;
  bool selected;
}

class GameFile{
  String year;
  List<Tuple2<String,String>> coachAndTeams;
}
