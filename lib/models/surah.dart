class Surah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelstionType;
  Surah(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.numberOfAyahs,
      this.revelstionType});
  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      numberOfAyahs: json['numberOfAyahs'],
      revelstionType: json['revelationType']
    );
  }
}
