// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dataclass/dataclass.dart';
import 'package:firestore_annotations/firestore_annotations.dart';
import 'package:prophecies_repository/src/entities/prophecy_entity.dart';

import '../../../prophecies_repository.dart';

part 'firebase_prophecy_entity.g.dart';

@FirestoreDocument()
@dataClass
class FirebaseProphecyEntity extends ProphecyEntity {
  final selfRef;

  FirebaseProphecyEntity({this.selfRef, id, name, value}) {
    ProphecyEntity(id: id, name: name, value: value);
  }

  static FirebaseProphecyEntity fromSnapshot(DocumentSnapshot snap) =>
      _$firebaseProphecyEntityFromSnapshot(snap);

  Map<String, Object> toDocument() => _$firebaseProphecyEntityToMap(this);

  static FirebaseProphecyEntity toEntity(Prophecy prophecy) =>
      FirebaseProphecyEntity(
          id: prophecy.id, name: prophecy.name, value: prophecy.value);

  static Prophecy fromEntity(ProphecyEntity entity) =>
      Prophecy(id: entity.id, name: entity.name, value: entity.value);
}
