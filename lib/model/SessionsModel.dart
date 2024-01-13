class SessionsModel {
  SessionsModel({
      this.lectures,});

  SessionsModel.fromJson(dynamic json) {
    if (json['lectures'] != null) {
      lectures = [];
      json['lectures'].forEach((v) {
        lectures?.add(Lectures.fromJson(v));
      });
    }
  }
  List<Lectures>? lectures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (lectures != null) {
      map['lectures'] = lectures?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Lectures {
  Lectures({
      this.id, 
      this.teacherId, 
      this.studentId, 
      this.startTime, 
      this.endTime, 
      this.duration, 
      this.topic, 
      this.status, 
      this.notes, 
      this.createdAt, 
      this.updatedAt,});

  Lectures.fromJson(dynamic json) {
    id = json['id'];
    teacherId = json['teacher_id'];
    studentId = json['student_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    duration = json['duration'];
    topic = json['topic'];
    status = json['status'];
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? teacherId;
  int? studentId;
  String? startTime;
  String? endTime;
  int? duration;
  String? topic;
  String? status;
  String? notes;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['teacher_id'] = teacherId;
    map['student_id'] = studentId;
    map['start_time'] = startTime;
    map['end_time'] = endTime;
    map['duration'] = duration;
    map['topic'] = topic;
    map['status'] = status;
    map['notes'] = notes;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}