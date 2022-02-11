// ignore_for_file: overridden_fields

import 'package:cloud_firestore/cloud_firestore.dart';

import 'blog.dart';

class BlogModel extends Blog {
  BlogModel({
    required this.post,
    //required this.post1,
    required this.titulo,
    required this.id,
    required this.timesData,
  }) : super(
          post: post,
          // post1: post1,
          id: id,
          titulo: titulo,
          timesData: timesData,
        );

  @override
  final String post, titulo, id;
  @override
  final Timestamp timesData;

  factory BlogModel.fromJson(DocumentSnapshot json) => BlogModel(
      post: json["post"],
      //post1: json["post1"],
      id: json.id,
      titulo: json["titulo"],
      timesData: json["timesData"]);

  Map<String, dynamic> toJson() => {
        "post": post,
        //  "post1": post1,
        "id": id,
        "titulo": titulo,
        "timesData": timesData,
      };

  @override
  List<Object?> get props => [
        post,
        id,
        titulo,
        timesData,
      ];
}
