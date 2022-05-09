part of 'blog_cubit.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

class BlogInitial extends BlogState {}

class BlogLoaded extends BlogState {
  final List<Blog>  blog;
  const BlogLoaded(this.blog);

  @override
  List<Object> get props => [blog];
}

class BlogLoading extends BlogState {}

class BlogError extends BlogState {
  final String error;
  const BlogError(this.error);
  @override
  List<Object> get props => [error];
}
