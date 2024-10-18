import 'package:flutter/material.dart';

import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_text_styles.dart';
import '../../../domain/entities/movies.dart';
import '../../../movies_strings.dart';

class MovieItemMolecule extends StatelessWidget {
  const MovieItemMolecule({
    super.key,
    required this.movie,
  });

  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: AppColors.primary,
              image: DecorationImage(
                image: NetworkImage(movie.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: AppTextStyles.rajdhaniBold20,
                ),
                Text(
                  MoviesStrings.movies.release(movie.releaseDate),
                  style: AppTextStyles.rajdhaniRegular16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
