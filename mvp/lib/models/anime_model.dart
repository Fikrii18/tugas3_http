class Anime{
  final int id;
  final String name;
  final String imageUrl;
  final String familyCreator;

  Anime ({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.familyCreator,
  });

  factory Anime.fromJson(Map<String, dynamic> json){
    return Anime(id: json['id'] ?? 0, 
    name: json['name'], 
    imageUrl: (json['images'] != null && json['images'].isNotEmpty)?
    json['images'] [0] 
    : 'https://placehold.co/600x400',
    familyCreator: (json['family'] != null) ?
    (json['family']['creator'] ?? "Family Creator Empty")
    : "gaada Keluarga");
    }
}