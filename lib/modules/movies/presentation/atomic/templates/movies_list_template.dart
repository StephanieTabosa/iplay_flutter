import 'package:flutter/material.dart';

import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_text_styles.dart';
import '../../../domain/entities/movies.dart';
import '../../../movies_strings.dart';
import '../molecules/movie_item_molecule.dart';

class MoviesListTemplate extends StatelessWidget {
  const MoviesListTemplate({
    super.key,
    required this.movies,
    required this.isLoading,
    required this.openDetailsPage,
    this.error = false,
  });

  final List<Movies> movies;
  final bool isLoading;
  final bool error;
  final void Function(Movies) openDetailsPage;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: CircularProgressIndicator(
            color: AppColors.secondary,
          ),
        ),
      );
    } else if (error) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.close,
                size: 50,
                color: AppColors.red,
              ),
              const SizedBox(height: 16),
              Text(
                MoviesStrings.movies.errorMessage,
                style: AppTextStyles.rajdhaniRegular20
                    .copyWith(color: AppColors.white.withOpacity(0.87)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MoviesStrings.movies.title,
                style: AppTextStyles.rajdhaniBold24,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => openDetailsPage(movies[index]),
                      child: MovieItemMolecule(movie: movies[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
