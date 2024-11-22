// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';
import 'package:equatable/equatable.dart';

class AppFileModel extends Equatable {
  String? name;
  String? size;
  File file;
  AppFileModel({
    this.name,
    this.size,
    required this.file,
  });

  factory AppFileModel.empty() => AppFileModel(
        file: File(''),
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? '',
        'size': size ?? "0.0",
        'file': file,
      };

  factory AppFileModel.fromJson(Map<String, dynamic> json) {
    return AppFileModel(
      name: json['name'] as String,
      size: json['size'] as String,
      file: json['file'],
    );
  }

  AppFileModel copyWith({
    String? name,
    String? size,
    File? file,
  }) {
    return AppFileModel(
      name: name ?? this.name,
      size: size ?? this.size,
      file: file ?? this.file,
    );
  }

  @override
  String toString() {
    return "name: $name -- Size: $size--- File:$file";
  }

  @override
  List<Object?> get props => [name];
}
