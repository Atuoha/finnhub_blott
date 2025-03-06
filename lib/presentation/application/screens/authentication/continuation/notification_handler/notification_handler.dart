import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../../application/routes/app_route_config.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/enums/status.dart';
import '../../../../../../core/global_config.dart';
import '../../../../../../core/theme/font_manager.dart';
import '../../../../../../core/theme/styles_manager.dart';
import '../../../../../core/components/toast_info.dart';

class NotificationHandler {
  void requestNotificationAccess({required BuildContext context}) async {
    if (Platform.isAndroid &&
        Platform.operatingSystemVersion.contains(AppStrings.THIRTY_THREE)) {
      PermissionStatus status = await Permission.notification.request();
      if (context.mounted) {
        _handlePermissionStatus(status, context: context);
      }
    } else if (Platform.isIOS) {
      PermissionStatus status = await Permission.notification.request();
      if (context.mounted) {
        _handlePermissionStatus(status, context: context);
      }
    } else {
      toastInfo(
        msg: "Notification permission is granted by default",
        status: Status.success,
      );
      GlobalConfig.storageService.setBoolValue(
        AppStrings.SEEN_NOTIFICATION_SECTION,
        true,
      );
      context.pushReplacementNamed(AppRoutes.homeScreen);
    }
  }

  void _handlePermissionStatus(PermissionStatus status,
      {required BuildContext context}) {
    if (status.isGranted) {
      toastInfo(
        msg: "Notification permission is granted",
        status: Status.success,
      );
      GlobalConfig.storageService.setBoolValue(
        AppStrings.SEEN_NOTIFICATION_SECTION,
        true,
      );
      context.pushReplacementNamed(AppRoutes.homeScreen);
    } else if (status.isDenied) {
      toastInfo(
        msg: "Notification permission is denied",
        status: Status.error,
      );
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void checkNotificationPermission(BuildContext context) async {
    PermissionStatus status = await Permission.notification.status;
    if (context.mounted) {
      if (status.isDenied || status.isPermanentlyDenied || !status.isGranted) {
        showPrePermissionDialog(context);
      } else {
        //PS:  DID THIS JUST TO SHOWCASE THE NOTIFICATION PERMISSION, RECENT ANDROID VERSION DON'T REQUIRE PERMISSIONS FOR NOTIFICATIONS
        showPrePermissionDialog(context);
      }
    }
  }

  void showPrePermissionDialog(BuildContext context) {
    // This is meant to be isIOS but I changed it to isAndroid so I can demonstrate the exact notification dialog on the design
    if (Platform.isAndroid) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(AppStrings.ALLOW_NOTIFICATIONS_TITLE),
            content: Text(AppStrings.ALLOW_NOTIFICATIONS_DESC),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: Text("Don't Allow"),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                  requestNotificationAccess(context: context);
                },
                isDefaultAction: true,
                child: Text("Allow"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              AppStrings.ALLOW_NOTIFICATIONS_TITLE,
              textAlign: TextAlign.center,
              style: getMediumStyle(
                color: Colors.black,
                fontSize: FontSize.s18,
              ),
            ),
            content: Text(AppStrings.ALLOW_NOTIFICATIONS_DESC),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Don't Allow"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  requestNotificationAccess(context: context);
                },
                child: Text("Allow"),
              ),
            ],
          );
        },
      );
    }
  }
}
