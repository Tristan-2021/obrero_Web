import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nombreapp/example/model/blog.dart';
import 'package:nombreapp/example/model/model_blog.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogInitial());
  List<BlogModel> blogmodelista = [];

  Future<void> getData() async {
   
      emit( BlogLoaded(  blogmodelista1));

 
  }


  }

  // Future<Blog> lista(String id) async {
  //   var ka = FirebaseFirestore.instance.collection('data').doc(id);
  //   final v = await ka.get();
  //   if (v.exists) {
  //     final das = BlogModel.fromJson(v);
  //     return das;
  //   }
  //   return Blog(
  //     imglink: '',
  //       post: '',
  //       titulo: 'No Exite el artículo',
  //       id: '',
  //       timesData: Timestamp(1636042678, 277200000));

  // }


   List<BlogModel> blogmodelista1 = [
      BlogModel(
        imglink: 'https://media.istockphoto.com/photos/green-code-in-command-line-interface-cli-unix-bash-shell-picture-id1136778932?k=20&m=1136778932&s=612x612&w=0&h=vCDnB19JBjA1dwQyKmgRCQEHC85aoQyeGUlMBeXG3yw=',
          post: 'https://medium.com/@candangasrodriguito/implementando-un-login-usando-firebase-con-la-metodolog%C3%ADa-tdd-1-part-bd162c57af04',
          titulo: 'Escribe tu primer CLI en Dart',
          id: '1',
         // timesData: Timestamp(1636042678, 277000000) 
          
          ),
      BlogModel(
        imglink: 'https://xurxodev.com/content/images/2016/07/CleanArchitecture-8b00a9d7e2543fa9ca76b81b05066629.jpg',
          post: 'https://medium.com/@candangasrodriguito/implementando-un-login-usando-firebase-con-la-metodolog%C3%ADa-tdd-1-part-bd162c57af04',
          titulo: 'Implementando un Login usando Firebase con la metodología TDD! 1 part.',
          id: '2',
         // timesData: Timestamp(1636042678, 277200000)
          ),
      BlogModel(
        imglink: 'https://xurxodev.com/content/images/2016/07/CleanArchitecture-8b00a9d7e2543fa9ca76b81b05066629.jpg',
          post: '3',
          titulo: 'Implementando un Login usando Firebase con la metodología TDD! 2 part.',
          id: '3',
         // timesData: Timestamp(1636042678, 277400000)
          ),
   
    ];