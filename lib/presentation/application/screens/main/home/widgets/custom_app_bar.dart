import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../application/blocs/news_impl/news_impl_bloc.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/constants/enums/processing_status.dart';
import '../../../../../../core/theme/font_manager.dart';
import '../../../../../../core/theme/styles_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.firstName,
    required this.state,
  });

  final String firstName;
  final NewsImplState state;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: MediaQuery.of(context).size.width * 0.9,
      toolbarHeight: 150,
      leading: Padding(
        padding: const EdgeInsets.only(left: 18.0, top: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey $firstName',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getBoldStyle(color: Colors.white, fontSize: FontSize.s30),
            ),
            Gap(state.processingStatus == ProcessingStatus.error ? 10 : 0),
            state.processingStatus == ProcessingStatus.error
                ? Text(
              AppStrings.SOMETHING_WENT_WRONG,
              style: getRegularStyle(
                color: Colors.white,
                fontSize: FontSize.s14,
              ),
            )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}