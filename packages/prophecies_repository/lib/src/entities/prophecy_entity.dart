// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:dataclass/dataclass.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prophecy_entity.g.dart';

@JsonSerializable()
@dataClass
class ProphecyEntity extends _$ProphecyEntity {
  final String id;
  final String name;
  final double value;

  const ProphecyEntity({this.id, this.name, this.value});

  Map<String, Object> toJson() => _$ProphecyEntityToJson(this);

  static ProphecyEntity fromJson(Map<String, Object> json) =>
      _$ProphecyEntityFromJson(json);

}
