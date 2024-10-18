import 'package:flutter/material.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_text_styles.dart';
import '../../../domain/entities/movies.dart';
import '../../../movies_strings.dart';

class MoviesDetailsTemplate extends StatelessWidget {
  const MoviesDetailsTemplate({
    super.key,
    required this.movie,
  });

  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              movie.title,
              style: AppTextStyles.rajdhaniBold24,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                height: 235,
                width: 175,
                child: Image.network(
                  movie.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              MoviesStrings.details.rate(movie.rate),
              style: AppTextStyles.rajdhaniBold20,
            ),
            const SizedBox(height: 16),
            Text(
              movie.synopsis,
              style: AppTextStyles.rajdhaniRegular16
                  .copyWith(color: AppColors.white.withOpacity(0.87)),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }
}
