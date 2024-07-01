class SurahTranslationList {
  final List<SurahTraslation> translationlist;
  SurahTranslationList({required this.translationlist});
  factory SurahTranslationList.fromJson(Map<String, dynamic> map) {
    Iterable translation = map['result'];
    List<SurahTraslation> list =
        translation.map((e) => SurahTraslation.fromJson(e)).toList();
    return SurahTranslationList(translationlist: list);
  } 
}

class SurahTraslation {
  String? sura;
  String? aya;
  String? arabic_text;
  String? translation;
  SurahTraslation({this.sura, this.aya, this.arabic_text, this.translation});
  factory SurahTraslation.fromJson(Map<String, dynamic> json) {
    return SurahTraslation(
      arabic_text: json['arabic_text'],
      aya: json['aya'],
      sura: json['sura'],
      translation: json['translation'],
    );
  }
}
