import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../gen/assets.gen.dart';


class EmptyListMsg extends StatelessWidget {
  const EmptyListMsg({
    super.key,
    required this.msg,
  });

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.opps.image(width: 200),
          Text(
            msg,
            style: const TextStyle(
              color: AppColors.greyFadeText,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
