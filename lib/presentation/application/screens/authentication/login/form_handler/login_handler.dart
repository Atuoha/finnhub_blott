import 'package:finnhub_news/core/extensions/loading.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../application/routes/app_route_config.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/enums/status.dart';
import '../../../../../../core/global_config.dart';
import '../../../../../core/components/toast_info.dart';

class LoginHandler {
  void config({
    required BuildContext context,
    required TextEditingController firstName,
    required TextEditingController lastName,
  }) {
    context.showLoader();
    Future.delayed(Duration(seconds: 5),(){
      GlobalConfig.storageService.setBoolValue(
        AppStrings.IS_AUTHENTICATED,
        true,
      );
      GlobalConfig.storageService.setStringValue(
        AppStrings.USER_NAME,
        "${firstName.text.trim()} ${lastName.text.trim()}",
      );
      if(context.mounted){
        context.hideLoader();
        context.pushReplacementNamed(AppRoutes.continueScreen);
      }
    });

  }

  void submit({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController firstName,
    required TextEditingController lastName,
  }) {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) {
      toastInfo(msg: "Please fill all fields", status: Status.error);
      return;
    }

    config(context: context, firstName: firstName, lastName: lastName);
  }
}
