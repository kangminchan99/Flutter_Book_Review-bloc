import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/core/utils/constant/network_constant.dart';
import 'package:bookreview/src/features/book_info/domain/model/book_review_info_model.dart';
import 'package:bookreview/src/features/book_info/presentation/pages/book_info_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class RecentReviewItemWidget extends StatelessWidget {
  final BookReviewInfoModel bookReviewInfoModel;
  const RecentReviewItemWidget({super.key, required this.bookReviewInfoModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        context.pushNamed(
          BookInfoPage.routerName,
          extra: bookReviewInfoModel.bookInfo,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Stack(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Hero(
                    tag: bookReviewInfoModel.bookInfo?.image ?? '',
                    child: CachedNetworkImage(
                      imageUrl:
                          bookReviewInfoModel.bookInfo?.image ?? defaultImgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.only(left: 15),
                    color: AppColors.black.withValues(alpha: 0.5),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/icons/icon_star.svg',
                          width: 22,
                        ),
                        SizedBox(width: 5),
                        Text(
                          ((bookReviewInfoModel.totalRating ?? 0) /
                                  (bookReviewInfoModel.reviewerIds?.length ??
                                      0))
                              .toStringAsFixed(2),
                          style: AppTextStyle.mediumWhite.copyWith(
                            color: AppColors.btnBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Text(
            bookReviewInfoModel.bookInfo?.title ?? '제목 없음',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.xLargeWhiteBold,
          ),
          SizedBox(height: 5),
          Text(
            bookReviewInfoModel.bookInfo?.author ?? '작가명 없음',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.mediumWhite.copyWith(color: AppColors.gray),
          ),
        ],
      ),
    );
  }
}
