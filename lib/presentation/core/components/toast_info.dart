import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/enums/status.dart';

toastInfo({
  required String msg,
  required Status status,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor:
        status == Status.error ? Colors.red : AppColors.primaryColor,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM_LEFT,
    timeInSecForIosWeb: 6,
  );
}
