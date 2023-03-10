// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_firebase_full_news_app/product/utility/base/base_firebase_model.dart';

@immutable
class Recommended with EquatableMixin, BaseFirebaseModel<Recommended>, IdModel {
  const Recommended({
    this.image,
    this.description,
    this.title,
    this.id,
  });

  final String? image;
  final String? description;
  final String? title;
  @override
  final String? id;

  @override
  List<Object?> get props => [image, description, title, id];

  Recommended copyWith({
    String? image,
    String? description,
    String? title,
    String? id,
  }) {
    return Recommended(
      image: image ?? this.image,
      description: description ?? this.description,
      title: title ?? this.title,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'description': description,
      'title': title,
    };
  }

  @override
  Recommended fromJson(Map<String, dynamic> json) {
    return Recommended(
      image: json['image'] as String?,
      description: json['description'] as String?,
      title: json['title'] as String?,
    );
  }
}
