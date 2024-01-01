class QuraanModel {
  QuraanModel({
      this.code, 
      this.status, 
      this.data,});

  QuraanModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? code;
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.surahs, 
      this.edition,});

  Data.fromJson(dynamic json) {
    if (json['surahs'] != null) {
      surahs = [];
      json['surahs'].forEach((v) {
        surahs?.add(Surahs.fromJson(v));
      });
    }
    edition = json['edition'] != null ? Edition.fromJson(json['edition']) : null;
  }
  List<Surahs>? surahs;
  Edition? edition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (surahs != null) {
      map['surahs'] = surahs?.map((v) => v.toJson()).toList();
    }
    if (edition != null) {
      map['edition'] = edition?.toJson();
    }
    return map;
  }

}

class Edition {
  Edition({
      this.identifier, 
      this.language, 
      this.name, 
      this.englishName, 
      this.format, 
      this.type,});

  Edition.fromJson(dynamic json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
  }
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identifier'] = identifier;
    map['language'] = language;
    map['name'] = name;
    map['englishName'] = englishName;
    map['format'] = format;
    map['type'] = type;
    return map;
  }

}

class Surahs {
  Surahs({
      this.number, 
      this.name, 
      this.englishName, 
      this.englishNameTranslation, 
      this.revelationType, 
      this.ayahs,});

  Surahs.fromJson(dynamic json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    if (json['ayahs'] != null) {
      ayahs = [];
      json['ayahs'].forEach((v) {
        ayahs?.add(Ayahs.fromJson(v));
      });
    }
  }
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<Ayahs>? ayahs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['name'] = name;
    map['englishName'] = englishName;
    map['englishNameTranslation'] = englishNameTranslation;
    map['revelationType'] = revelationType;
    if (ayahs != null) {
      map['ayahs'] = ayahs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Ayahs {
  Ayahs({
      this.number, 
      this.text, 
      this.numberInSurah, 
      this.juz, 
      this.manzil, 
      this.page, 
      this.ruku, 
      this.hizbQuarter, 
      this.sajda,});

  Ayahs.fromJson(dynamic json) {
    number = json['number'];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['text'] = text;
    map['numberInSurah'] = numberInSurah;
    map['juz'] = juz;
    map['manzil'] = manzil;
    map['page'] = page;
    map['ruku'] = ruku;
    map['hizbQuarter'] = hizbQuarter;
    map['sajda'] = sajda;
    return map;
  }

}