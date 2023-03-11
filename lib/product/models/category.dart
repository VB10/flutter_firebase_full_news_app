// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_firebase_full_news_app/product/utility/base/base_firebase_model.dart';

@immutable
class CategoryModel extends Equatable
    with IdModel, BaseFirebaseModel<CategoryModel> {
  CategoryModel({
    this.detail,
    this.name,
    this.id,
  });

  final String? detail;
  final String? name;
  @override
  final String? id;

  @override
  List<Object?> get props => [id];

  CategoryModel copyWith({
    String? detail,
    String? name,
    String? id,
  }) {
    return CategoryModel(
      detail: detail ?? this.detail,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  CategoryModel fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      detail: json['detail'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
    );
  }
}
