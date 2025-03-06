import 'package:finnhub_news/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/styles_manager.dart';
import '../../../../../gen/assets.gen.dart';
import 'notification_handler/notification_handler.dart';

class ContinuationScreen extends StatefulWidget {
  const ContinuationScreen({super.key});

  @override
  State<ContinuationScreen> createState() => _ContinuationScreenState();
}

class _ContinuationScreenState extends State<ContinuationScreen> {
  final NotificationHandler notificationHandler = NotificationHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.images.iconSvg),
            Gap(15),
            Text(
              AppStrings.GET_THE_MOST,
              style: getMediumStyle(
                color: Colors.black,
                fontSize: FontSize.s17,
              ),
            ),
            Gap(5),
            Text(
              AppStrings.NOTIFICATION_TEXT,
              textAlign: TextAlign.center,
              style: getLightStyle(
                color: AppColors.greyTextColor,
                fontSize: FontSize.s14,
              ),
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () =>
                  notificationHandler.checkNotificationPermission(context),
              child: Text(
                "Continue",
                style: getRegularStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
