import 'package:flutter/material.dart';

import '../../../../shared/constants/app_assets.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_text_styles.dart';
import '../../../movies_strings.dart';
import '../atoms/button_atom.dart';

class MoviesHomeTemplate extends StatelessWidget {
  const MoviesHomeTemplate({
    super.key,
    required this.onContinueButtonTap,
  });

  final VoidCallback onContinueButtonTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppAssets.logo,
              height: 200,
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MoviesStrings.home.descriptionMovies,
                  style: AppTextStyles.rajdhaniBold40.copyWith(color: AppColors.lightGrey),
                  textAlign: TextAlign.left,
                ),
                Text(
                  MoviesStrings.home.discoverNewMovies,
                  style: AppTextStyles.rajdhaniRegular20.copyWith(color: AppColors.lightGrey),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ButtonAtom(
          text: MoviesStrings.home.buttonText,
          onPressed: onContinueButtonTap,
        ),
      ),
    );
  }
}
