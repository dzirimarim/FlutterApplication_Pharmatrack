class TourModel {
  int id;
  int distance;
  int nombreLivraisons;
  int nbreKilometres;
  String dateTournee;
  String dateDebutReelle;
  String dateDebutPrev;
  String dateLivReelle;
  String dateLivPrev;

  TourModel(
      {this.id,
      this.distance,
      this.nombreLivraisons,
      this.nbreKilometres,
      this.dateTournee,
      this.dateDebutReelle,
      this.dateDebutPrev,
      this.dateLivReelle,
      this.dateLivPrev});

  factory TourModel.fromJson(Map<String, dynamic> json) => TourModel(
      distance: json["distance"],
      nombreLivraisons: json["nombreLivraisons"],
      nbreKilometres: json["nbreKilometres"],
      dateTournee: json["dateTournee"],
      dateDebutReelle: json["dateDebutReelle"],
      dateDebutPrev: json["dateDebutPrev"],
      dateLivReelle: json["dateLivReelle"],
      dateLivPrev: json["dateLivPrev"],
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "distance": distance,
        "nombreLivraisons": nombreLivraisons,
        "nbreKilometres": nbreKilometres,
        "dateTournee": dateTournee,
        "dateDebutReelle": dateDebutReelle,
        "dateDebutPrev": dateDebutPrev,
        "dateLivReelle": dateLivReelle,
        "dateLivPrev": dateLivPrev,
        'id': id,
      };

  /* String get dateDebutReelle => dateDebutReelle;

  String get dateLivPrev => dateLivPrev;*/
}
