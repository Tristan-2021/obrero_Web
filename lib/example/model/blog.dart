import 'package:equatable/equatable.dart';

class Blog extends Equatable {
  final String post, titulo, id, imglink;
 // final Timestamp timesData;
  const Blog({
    required this.post,
    // required this.post1,
    required this.titulo,
    required this.id,
    required this.imglink,
    //required this.timesData,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [post, titulo, id, imglink];
}
