import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/font_manager.dart';
import '../../../../../../core/theme/styles_manager.dart';
import '../../../../../../domain/models/news_model/news.dart';
import '../../../../../core/components/k_cached_image.dart';

class SingleNews extends StatelessWidget {
  const SingleNews({
    super.key,
    required this.news,
    required this.formattedDate,
  });

  final News news;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 8,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          KCachedImage(
            image: news.image,
            height: MediaQuery.sizeOf(context).height / 8,
            width: 100,
          ),
          Gap(15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          news.source.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getRegularStyle(
                            color: AppColors.whiteShade,
                            fontSize: FontSize.s13,
                          ),
                        ),
                      ),
                      Gap(5),
                      Expanded(
                        child: Text(
                          formattedDate,
                          style: getRegularStyle(
                            color: AppColors.whiteShade,
                            fontSize: FontSize.s13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(5),
                  Text(
                    news.headline,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: getBoldStyle(
                      color: Colors.white,
                      fontSize: FontSize.s16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
