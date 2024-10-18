import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../movies_module.dart';
import '../atomic/templates/movies_details_template.dart';
import '../cubits/movies_details_cubit.dart';

class MoviesDetailsPage extends StatefulWidget {
  const MoviesDetailsPage({super.key});

  static const routeName = '/movies-details';
  static const routePath = MoviesModule.routePath + routeName;

  @override
  State<MoviesDetailsPage> createState() => _MoviesDetailsPageState();
}

class _MoviesDetailsPageState extends State<MoviesDetailsPage> {
  final cubit = Modular.get<MoviesDetailsCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
      bloc: cubit,
      builder: (context, state) {
        return MoviesDetailsTemplate(movie: state.movie);
      },
    );
  }
}
