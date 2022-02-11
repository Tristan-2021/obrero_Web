part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<int> listaNumeros;

  HomePageLoaded(this.listaNumeros);
}

class HomePageLoading extends HomePageState {}

class HomePageError extends HomePageState {}
