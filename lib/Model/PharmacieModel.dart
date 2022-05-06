class PharmacieModel {
  int id;
  String nomPharmacie;
  String numeroTel;
  String adresseEmail;
  String logopharma;
  String qrcode;
  /*List adresses;
  List reclamations;
  List livraisons;*/

  PharmacieModel({
    this.id,
    this.nomPharmacie,
    this.numeroTel,
    this.adresseEmail,
    this.logopharma,
    this.qrcode,
    /*this.adresses,
      this.reclamations,
      this.livraisons*/
  });

  factory PharmacieModel.fromJson(Map<String, dynamic> json) => PharmacieModel(
      nomPharmacie: json["nomPharmacie"],
      numeroTel: json["numeroTel"],
      adresseEmail: json["adresseEmail"],
      logopharma: json["logopharma"],
      qrcode: json["qrcode"],
      /*adresses: json["adresses"],
      reclamations: json["reclamations"],
      livraisons: json["livraisons"],*/
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "nomPharmacie": nomPharmacie,
        "numeroTel": numeroTel,
        "adresseEmail": adresseEmail,
        "logopharma": logopharma,
        "qrcode": qrcode,
        /*"adresses": adresses,
        "reclamations": reclamations,
        "livraisons": livraisons,*/
        'id': id,
      };
}
