// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_prophecy_entity.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$FirebaseProphecyEntity {
  const _$FirebaseProphecyEntity();

  dynamic get selfRef;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! FirebaseProphecyEntity) return false;

    return true && this.selfRef == other.selfRef;
  }

  int get hashCode {
    return mapPropsToHashCode([selfRef]);
  }

  String toString() {
    return 'FirebaseProphecyEntity <\'selfRef\': ${this.selfRef},>';
  }

  FirebaseProphecyEntity copyWith({dynamic selfRef}) {
    return FirebaseProphecyEntity(
      selfRef: selfRef ?? this.selfRef,
    );
  }
}

// **************************************************************************
// FirestoreDocumentGenerator
// **************************************************************************

FirebaseProphecyEntity _$firebaseProphecyEntityFromSnapshot(
    DocumentSnapshot snapshot) {
  return FirebaseProphecyEntity(selfRef: snapshot.reference);
}

FirebaseProphecyEntity _$firebaseProphecyEntityFromMap(
    Map<String, dynamic> data) {
  return FirebaseProphecyEntity();
}

Map<String, dynamic> _$firebaseProphecyEntityToMap(
    FirebaseProphecyEntity model) {
  return <String, dynamic>{};
}
