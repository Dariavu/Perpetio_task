part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}

class ErrorState extends HomeState {}

class DataGotState extends HomeState {
  final List<String> data;

  DataGotState({
    required this.data,
  });
}
