import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:nombreapp/example/model/blog.dart';
import 'package:nombreapp/example/model/model_blog.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitial());
  List<BlogModel> blogmodelista = [];

  Future<void> getData() async {
    emit(BlogInitial());
    List<Blog> data = await casa();
    if (data.isNotEmpty) {
      emit(BlogLoaded(data));
    } else {
      emit(const BlogError(
          'Hubo un error con el Servidor, lo estamos arreglando'));
    }
  }

  Future<List<Blog>> casa() async {
    final _firebaseFirestore = FirebaseFirestore.instance.collection('data');
    try {
      var data = await _firebaseFirestore.get();
      List<QueryDocumentSnapshot> bloglista = data.docs;
      for (var element in bloglista) {
        if (element.exists) {
          blogmodelista.add(BlogModel.fromJson(element));
        }
      }
      return blogmodelista;
    } catch (e) {
      return [];
    } finally {}
  }

  Future<Blog> lista(String id) async {
    var ka = FirebaseFirestore.instance.collection('data').doc(id);
    final v = await ka.get();
    if (v.exists) {
      final das = BlogModel.fromJson(v);
      return das;
    }
    return Blog(
        post: '',
        titulo: 'No Exite el artículo',
        id: '',
        timesData: Timestamp(1636042678, 277200000));
    // return Future.delayed(const Duration(microseconds: 1500), () {
    //   return blogmodelista.singleWhere((ele) => ele.id == id,
    //       orElse: () => throw Exception('unknown person $id for family $id'));
    // });
  }
}

   // List<BlogModel> blogmodelista1 = [
    //   BlogModel(
    //       post: '1',
    //       titulo: 'titulo',
    //       id: '1',
    //       timesData: Timestamp(1636042678, 277000000)),
    //   BlogModel(
    //       post: '2',
    //       titulo: 'titulo 2',
    //       id: '2',
    //       timesData: Timestamp(1636042678, 277200000)),
    //   BlogModel(
    //       post: '3',
    //       titulo: 'titulo 3',
    //       id: '3',
    //       timesData: Timestamp(1636042678, 277400000)),
    //   BlogModel(
    //       post: '4',
    //       titulo: 'titulo 4',
    //       id: '4',
    //       timesData: Timestamp(1636042678, 277400000)),
    // ];