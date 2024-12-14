import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Testoo extends Equatable {
  String id;
  String name;

  Testoo({required this.id, required this.name});

  @override
  List<Object?> get props => [id];
}
