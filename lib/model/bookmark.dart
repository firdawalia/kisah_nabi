class Bookmark {
  int? id;
  String? number;
  String? name;
  String? thnKelahiran;
  dynamic usia;
  String? description;
  String? tmp;
  String? iconUrl;

  Bookmark({
    this.id,
    required this.number,
    required this.name,
    required this.thnKelahiran,
    required this.usia,
    required this.description,
    required this.tmp,
    required this.iconUrl,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['number'] = number;
    map['name'] = name;
    map['thn_kelahiran'] = thnKelahiran;
    map['usia'] = usia;
    map['description'] = description;
    map['tmp'] = tmp;
    map['icon_url'] = iconUrl;

    return map;
  }

  Bookmark.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    number = map['number'];
    name = map['name'];
    thnKelahiran = map['thn_kelahiran'];
    usia = map['usia'];
    description = map['description'];
    tmp = map['tmp'];
    iconUrl = map['icon_url'];
  }

}

