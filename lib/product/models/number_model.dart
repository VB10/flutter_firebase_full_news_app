// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_firebase_full_news_app/product/utility/base/base_firebase_model.dart';

class NumberModel extends Equatable
    with IdModel, BaseFirebaseModel<NumberModel> {
  NumberModel({
    this.number,
  });

  final String? number;
  @override
  String? id = '';

  NumberModel copyWith({
    String? number,
  }) {
    return NumberModel(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
    };
  }

  @override
  NumberModel fromJson(Map<String, dynamic> json) {
    return NumberModel(
      number: json['number'] as String?,
    );
  }

  @override
  List<Object?> get props => [number];
}
