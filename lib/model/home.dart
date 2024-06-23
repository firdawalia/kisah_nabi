class Home {
  int?number;
  String name;
  String thnKelahiran;
  dynamic usia;
  String description;
  String tmp;
  String iconUrl;

Home({
  required this.number,
  required this.name,
  required this.thnKelahiran,
  required this.usia,
  required this.description,
  required this.tmp,
  required this.iconUrl,
});

factory Home.fromJson(Map<String, dynamic> json) => Home(
  name: json["name"],
  number: json['number'],
  thnKelahiran: json["thn_kelahiran"],
  usia: json["usia"],
  description: json["description"],
  tmp: json["tmp"],
  iconUrl: json["icon_url"],
);

Map<String, dynamic> toJson() => {
  "name": name,
  "number": number,
  "thn_kelahiran": thnKelahiran,
  "usia": usia,
  "description": description,
  "tmp": tmp,
  "icon_url": iconUrl,
};
}


