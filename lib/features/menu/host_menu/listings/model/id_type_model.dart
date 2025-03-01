// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:get/get.dart';

enum IdType {
  interpassport,
  nationalid,
  driverlicense,
  nin,
  voterscard,
  none,
}

class IdTypeModel {
  final String uid;
  final IdType type;
  RxBool isActive;
  List<File> idFiles;
  IdTypeModel({
    required this.uid,
    required this.type,
    required this.isActive,
    required this.idFiles,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'type': type.name,
      'isActive': isActive.value,
      "idFiles": idFiles.map((x) => x.toString()).toList(),
    };
  }

  factory IdTypeModel.empty() => IdTypeModel(
        uid: "",
        type: IdType.none,
        idFiles: [],
        isActive: false.obs,
      );

  factory IdTypeModel.fromJson(Map<String, dynamic> json) {
    return IdTypeModel(
      uid: json['uid'] as String,
      type: IdType.values.firstWhere((id) => id.name == json['type']),
      isActive: (json['isActive'] as bool).obs,
      idFiles: (json['idFiles'] as List).map((x) => File(x)).toList(),
    );
  }

  @override
  String toString() =>
      "uid: $uid--type: $type--isActive: $isActive  --Idfile: $idFiles";

  IdTypeModel copyWith({
    String? uid,
    IdType? type,
    RxBool? isActive,
    List<File>? idFiles,
  }) {
    return IdTypeModel(
      uid: uid ?? this.uid,
      type: type ?? this.type,
      isActive: isActive ?? this.isActive,
      idFiles: idFiles ?? this.idFiles,
    );
  }
}
