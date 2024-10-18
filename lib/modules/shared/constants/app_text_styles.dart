import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  // Rajdhani

  static final rajdhaniBold40 = rajdhani(size: 40, weight: FontWeight.w700);

  static final rajdhaniBold24 = rajdhani(size: 24, weight: FontWeight.w700);

  static final rajdhaniBold20 = rajdhani(size: 20, weight: FontWeight.w700);

  static final rajdhaniRegular20 = rajdhani(size: 20, weight: FontWeight.w400);

  static final rajdhaniRegular16 = rajdhani(size: 16, weight: FontWeight.w400);

  static TextStyle rajdhani({required double size, required FontWeight weight}) {
    return GoogleFonts.rajdhani(
      textStyle: TextStyle(
        fontSize: size,
        color: AppColors.white,
        fontWeight: weight,
      ),
    );
  }
}
