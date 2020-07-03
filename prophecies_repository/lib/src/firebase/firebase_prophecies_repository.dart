import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../prophecies_repository.dart';
import '../prophecies_repository.dart';
import 'entities/firebase_prophecy_entity.dart';

class FirebaseProphecyRepository implements PropheciesRepository {
  final collection = Firestore.instance.collection('prophecies');

  Future<void> addNewProphecy(Prophecy prophecy) =>
      collection.add(FirebaseProphecyEntity.toEntity(prophecy).toDocument());

  Future<void> deleteProphecy(Prophecy prophecy) =>
      collection.document(prophecy.id).delete();

  @override
  Stream<List<Prophecy>> prophecies() => collection.snapshots().map((snap) =>
      snap.documents.map((doc) => FirebaseProphecyEntity.fromEntity(
          FirebaseProphecyEntity.fromSnapshot(doc))));

  Future<void> updateProphecy(Prophecy prophecy) => collection
      .document(prophecy.id)
      .updateData(FirebaseProphecyEntity.toEntity(prophecy).toDocument());
}
