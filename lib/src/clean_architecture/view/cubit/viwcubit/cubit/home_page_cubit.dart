import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  List<int> enteros = [];
  List<int> nmumber = List.generate(4, (index) => index * index);

  void numeros() {
    emit(HomePageInitial());
    emit(HomePageLoaded(nmumber));
  }
}
