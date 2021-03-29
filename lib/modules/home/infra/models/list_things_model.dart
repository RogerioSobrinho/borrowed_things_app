import 'dart:convert';

import 'package:borrowed_things/modules/home/domain/entities/things.dart';

class ListThingsModel extends Things {
  final String name;
  final String description;
  final DateTime loanDate;
  final String personName;
  final DateTime returnDate;

  ListThingsModel({
    this.name,
    this.description,
    this.loanDate,
    this.personName,
    this.returnDate,
  });

  ListThingsModel copyWith({
    String name,
    String description,
    DateTime loanDate,
    String personName,
    DateTime returnDate,
  }) {
    return ListThingsModel(
      name: name ?? this.name,
      description: description ?? this.description,
      loanDate: loanDate ?? this.loanDate,
      personName: personName ?? this.personName,
      returnDate: returnDate ?? this.returnDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'loanDate': loanDate.millisecondsSinceEpoch,
      'personName': personName,
      'returnDate': returnDate.millisecondsSinceEpoch,
    };
  }

  factory ListThingsModel.fromMap(Map<String, dynamic> map) {
    return ListThingsModel(
      name: map['name'],
      description: map['description'],
      loanDate: DateTime.fromMillisecondsSinceEpoch(map['loanDate']),
      personName: map['personName'],
      returnDate: DateTime.fromMillisecondsSinceEpoch(map['returnDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListThingsModel.fromJson(String source) =>
      ListThingsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListThingsModel(name: $name, description: $description, loanDate: $loanDate, personName: $personName, returnDate: $returnDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListThingsModel &&
        other.name == name &&
        other.description == description &&
        other.loanDate == loanDate &&
        other.personName == personName &&
        other.returnDate == returnDate;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        loanDate.hashCode ^
        personName.hashCode ^
        returnDate.hashCode;
  }
}
