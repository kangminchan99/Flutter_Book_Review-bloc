import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/search_book/presentation/cubit/search_book_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ResponseDataWidget extends StatelessWidget {
  final SearchBookCubit cubit;
  const ResponseDataWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    // 1) null-safe 가드
    final items = cubit.state.response?.items ?? const [];

    // 2) 빈 목록 처리 (상위에서 처리한다면 이 부분은 제거)
    if (items.isEmpty) {
      return const SizedBox.shrink();
      // 또는: return const EmptyViewWidget();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(color: AppColors.dividerColor),
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          final imageUrl = item.image;

          return Row(
            children: [
              // 3) 이미지가 없거나 빈 문자열이면 대체 박스
              SizedBox(
                width: 75,
                height: 115,
                child: (imageUrl != null && imageUrl.isNotEmpty)
                    ? CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover)
                    : const ColoredBox(color: AppColors.gray),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      item.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.mediumWhite,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.author ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.mediumWhite.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      item.description ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.mediumWhite,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
