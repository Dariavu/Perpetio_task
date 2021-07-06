import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perpetio_task/model/post_model.dart';
import 'package:perpetio_task/presentation/home/bloc/home_bloc.dart';
import 'package:perpetio_task/presentation/home/widget/posts_list.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (_, currState) =>
              currState is LoadingState ||
              currState is ErrorState ||
              currState is DataGotState,
          builder: (context, state) {
            if (state is LoadingState) {
              return _createLoading();
            } else if (state is ErrorState) {
              return _createError(state.message);
            } else if (state is DataGotState) {
              return _createData(state.data);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _createData(List<PostModel> posts) {
    return PostsList(posts: posts);
  }

  Widget _createLoading() {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 20,
      ),
    );
  }

  Widget _createError(String message) {
    return const Center(
      child: Text('Error'),
    );
  }
}
