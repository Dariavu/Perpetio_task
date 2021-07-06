import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:perpetio_task/model/post_model.dart';
import 'package:perpetio_task/service/api_client.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetDataEvent) {
      yield LoadingState();

      try {
        final posts = await ApiClient.fetchPosts();
        yield DataGotState(data: posts);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}
