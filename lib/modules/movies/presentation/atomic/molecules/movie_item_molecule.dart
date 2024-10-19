import 'package:flutter/material.dart';

import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_text_styles.dart';
import '../../../domain/entities/movies.dart';
import '../../../movies_strings.dart';

class MovieItemMolecule extends StatefulWidget {
  const MovieItemMolecule({
    super.key,
    required this.movie,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  final Movies movie;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  @override
  State<MovieItemMolecule> createState() => _MovieItemMoleculeState();
}

class _MovieItemMoleculeState extends State<MovieItemMolecule> {
  late ValueNotifier<bool> _isFavoriteNotifier;

  @override
  void initState() {
    super.initState();
    _isFavoriteNotifier = ValueNotifier<bool>(widget.isFavorite);
  }

  @override
  void dispose() {
    _isFavoriteNotifier.dispose();
    super.dispose();
  }

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
                image: NetworkImage(widget.movie.image),
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
                  widget.movie.title,
                  style: AppTextStyles.rajdhaniBold20,
                ),
                Row(
                  children: [
                    Text(
                      MoviesStrings.movies.release(widget.movie.releaseDate),
                      style: AppTextStyles.rajdhaniRegular16,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: _isFavoriteNotifier,
                      builder: (context, isFavorite, child) {
                        return IconButton(
                          onPressed: () {
                            widget.onFavoriteTap();
                            _isFavoriteNotifier.value = !isFavorite;
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: AppColors.red,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
