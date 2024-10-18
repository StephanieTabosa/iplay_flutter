import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../movies_module.dart';
import '../atomic/templates/movies_home_template.dart';
import '../cubits/movies_home_cubit.dart';

class MoviesHomePage extends StatefulWidget {
  const MoviesHomePage({super.key});

  static const routeName = '/movies-home';
  static const routePath = MoviesModule.routePath + routeName;

  @override
  State<MoviesHomePage> createState() => _MoviesHomePageState();
}

class _MoviesHomePageState extends State<MoviesHomePage> {
  final cubit = Modular.get<MoviesHomeCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesHomeCubit, MoviesHomeState>(
      bloc: cubit,
      builder: (context, state) {
        return MoviesHomeTemplate(
          onContinueButtonTap: cubit.onContinueButtonTap,
        );
      },
    );
  }
}
