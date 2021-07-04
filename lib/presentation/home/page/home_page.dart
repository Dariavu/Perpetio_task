import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perpetio_task/presentation/home/bloc/home_bloc.dart';
import 'package:perpetio_task/presentation/home/widget/home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<HomeBloc> _buildBody(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (_, HomeState currState) => currState is HomeInitial,
        builder: (context, state) {
          final bloc = BlocProvider.of<HomeBloc>(context);
          if (state is HomeInitial) {
            bloc.add(GetDataEvent());
          } else if (state is LoadingState) {
          } else if (state is DataGotState) {}
          return HomeContent();
        },
      ),
    );
  }
}
