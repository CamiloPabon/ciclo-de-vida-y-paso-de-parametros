class Chuknoris {
  final String icon_url;
  final String id;
  final String url;
  final String value;

  Chuknoris({
    required this.icon_url,
    required this.id,
    required this.url,
    required this.value,
  });

  factory Chuknoris.fromJson(Map<String, dynamic> json) {
    return Chuknoris(
      icon_url: json['icon_url'],
      id: json['id'],
      url: json['url'],
      value: json['value'],
    );
  }
}