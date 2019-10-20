class ListCursus {
  final List<Cursus> listCurs;
  ListCursus({this.listCurs});

  factory ListCursus.fromJson(List<dynamic> json) {
    List<Cursus> tab = new List<Cursus>();
    tab = json.map((i) => Cursus.fromJson(i)).toList();
    return ListCursus(listCurs: tab);
  }
}

class Cursus {
  int id;
  String nom;
  String image;
  ListLevel level;
  Cursus({
    this.id,
    this.nom,
    this.image,
    this.level,
  });
  factory Cursus.fromJson(Map<String, dynamic> json) => Cursus(
        id: json["id"],
        nom: json["nom"],
        image: json["image"],
        level: ListLevel.fromJson(json["level"]),
      );
  
}

class ListLevel {
  final List<Level> listLev;
  ListLevel({this.listLev});

  factory ListLevel.fromJson(List<dynamic> json) {
    List<Level> tab = new List<Level>();
    tab = json.map((i) => Level.fromJson(i)).toList();
    return ListLevel(listLev: tab);
  }
}

class Level {
  int id;
  String nom;
  String image;

  ListStage stage;

  Level({
    this.id,
    this.nom,
    this.image,
    this.stage,
  });

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        id: json["id"],
        nom: json["nom"],
        image: json["image"],
        stage: ListStage.fromJson(json["stage"]),
      );
}

class ListStage {
  final List<Stage> listSta;
  ListStage({this.listSta});

  factory ListStage.fromJson(List<dynamic> json) {
    List<Stage> tab = new List<Stage>();
    tab = json.map((i) => Stage.fromJson(i)).toList();
    return ListStage(listSta: tab);
  }
}
class Stage {
  int id;
  String nom;
  ListCour cour;

  Stage({
    this.id,
    this.nom,
    this.cour,
  });

  factory Stage.fromJson(Map<String, dynamic> json) => Stage(
        id: json["id"],
        nom: json["nom"],
        cour: ListCour.fromJson(json["cour"]),
      );
}

class ListCour {
  final List<Cour> listCour;
  ListCour({this.listCour});
  factory ListCour.fromJson(List<dynamic> json) {
    List<Cour> tabcour = new List<Cour>();
    tabcour = json.map((i) => Cour.fromJson(i)).toList();
    return ListCour(listCour: tabcour);
  }
}

class Cour {
  int id;
  String titre;
  ListVideo video;

  Cour({
    this.id,
    this.titre,
    this.video,
  });

  factory Cour.fromJson(Map<String, dynamic> json) => Cour(
        id: json["id"],
        titre: json["titre"],
        video: ListVideo.fromJson(json["video"]),
      );
}


class ListVideo {
  final List<Video> lisVideo;
  ListVideo({this.lisVideo});
  factory ListVideo.fromJson(List<dynamic> json) {
    List<Video> tabcour = new List<Video>();
    tabcour = json.map((i) => Video.fromJson(i)).toList();
    return ListVideo(lisVideo: tabcour);
  }
}

class Video {
  int id;
  String titre;
  String lien;

  Video({
    this.id,
    this.titre,
    this.lien,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        titre: json["titre"],
        lien: json["lien"],
      );
}
