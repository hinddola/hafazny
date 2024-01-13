class TeacherSessions {
  TeacherSessions({
      this.lectures,});

  TeacherSessions.fromJson(dynamic json) {
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
      this.updatedAt, 
      this.student, 
      this.teacher,});

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
    student = json['student'] != null ? Student.fromJson(json['student']) : null;
    teacher = json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
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
  Student? student;
  Teacher? teacher;

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
    if (student != null) {
      map['student'] = student?.toJson();
    }
    if (teacher != null) {
      map['teacher'] = teacher?.toJson();
    }
    return map;
  }

}

class Teacher {
  Teacher({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.avatar, 
      this.phone, 
      this.gender, 
      this.createdAt, 
      this.updatedAt, 
      this.roleId,});

  Teacher.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    avatar = json['avatar'];
    phone = json['phone'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleId = json['role_id'];
  }
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic avatar;
  String? phone;
  String? gender;
  String? createdAt;
  String? updatedAt;
  int? roleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['avatar'] = avatar;
    map['phone'] = phone;
    map['gender'] = gender;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['role_id'] = roleId;
    return map;
  }

}

class Student {
  Student({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.avatar, 
      this.phone, 
      this.gender, 
      this.createdAt, 
      this.updatedAt, 
      this.roleId,});

  Student.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    avatar = json['avatar'];
    phone = json['phone'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleId = json['role_id'];
  }
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic avatar;
  String? phone;
  String? gender;
  String? createdAt;
  String? updatedAt;
  int? roleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['avatar'] = avatar;
    map['phone'] = phone;
    map['gender'] = gender;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['role_id'] = roleId;
    return map;
  }

}