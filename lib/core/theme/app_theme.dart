import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import 'styles_manager.dart';
import 'values_manager.dart';
import 'font_manager.dart';

// Light Dark Theme
ThemeData getTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Colors.white,
        )
        .copyWith(
          background: Colors.white,
          onBackground: Colors.white,
        ),
    dialogBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: Colors.black,
    primaryColorDark: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    // dialog theme
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(
        color: Colors.black,
      ),
      contentTextStyle: const TextStyle(
        color: Colors.black,
      ),
    ),

    // Bottom sheet theme
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: CircleBorder(),
      elevation: 0,
      disabledElevation: 0,
    ),

    // card theme
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      shape: StadiumBorder(),
      disabledColor: AppColors.primaryLite,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        backgroundColor: AppColors.primaryColor,
        disabledBackgroundColor: AppColors.secondaryColor,
        disabledForegroundColor: Colors.white,
        textStyle: getRegularStyle(
          color: Colors.white,
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.normal,
        ),
      ),
    ),


    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.borderColor,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.borderColor,
        ),
      ),

      labelStyle: getRegularStyle(color: AppColors.greyTextColor,fontSize: FontSize.s16),
      hintStyle: getRegularStyle(color: AppColors.placeHolderColor, fontSize: FontSize.s15),
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      errorStyle: getRegularStyle(color: Colors.red),
      suffixIconColor: AppColors.primaryColor,
      suffixStyle: getRegularStyle(color: Colors.grey),
      prefixIconColor: AppColors.primaryColor,
      prefixStyle: getRegularStyle(color: Colors.grey),
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryColor,
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: AppSize.s40,
      ),
      centerTitle: true,
      elevation: AppSize.s0,
      titleTextStyle: getMediumStyle(
        color: Colors.black,
        fontSize: FontSize.s18,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    ),

    // text theme
    textTheme: TextTheme(
      displayLarge: getMediumStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ),
      bodySmall: getRegularStyle(
        color: Colors.black,
        fontSize: FontSize.s12,
      ),
      bodyLarge: getRegularStyle(
        color: Colors.black,
      ),
    ),
  );
}
