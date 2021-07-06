part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

class ErrorState extends HomeState {
  final String message;

  ErrorState({
    required this.message,
  });
}

class DataGotState extends HomeState {
  final List<PostModel> data;

  DataGotState({
    required this.data,
  });
}
