import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Blog extends Equatable {
  final String post, titulo, id;
  final Timestamp timesData;
  Blog({
    required this.post,
    // required this.post1,
    required this.titulo,
    required this.id,
    required this.timesData,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [post, titulo, id, timesData];
}
