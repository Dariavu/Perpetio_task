import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perpetio_task/presentation/home/bloc/home_bloc.dart';

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
              return _createError('Error');
            } else if (state is DataGotState) {
              return _createData();
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _createData() {
    return Center(
      child: Text('Hello'),
    );
  }

  Widget _createLoading() {
    return Center(
      child: CupertinoActivityIndicator(
        radius: 20,
      ),
    );
  }

  Widget _createError(String message) {
    return Center(
      child: Text('Error'),
    );
  }
}
