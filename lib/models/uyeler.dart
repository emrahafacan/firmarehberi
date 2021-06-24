class Uyeler {
  final int id;
  final String firmakodu;
  final String eposta;
  final String sifre;

  Uyeler({this.id, this.firmakodu, this.eposta, this.sifre});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firmakodu': firmakodu,
      'eposta': eposta,
      'sifre': sifre,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Uyeler{id: $id, firmakodu: $firmakodu, eposta: $eposta, sifre: $sifre}';
  }
}
