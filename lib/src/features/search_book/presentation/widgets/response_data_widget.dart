import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/book_info/presentation/pages/book_info_page.dart';
import 'package:bookreview/src/features/search_book/presentation/cubit/search_book_cubit.dart';
import 'package:bookreview/src/shared/domain/entities/common_state_status_enum.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResponseDataWidget extends StatefulWidget {
  final SearchBookCubit cubit;

  const ResponseDataWidget({super.key, required this.cubit});

  @override
  State<ResponseDataWidget> createState() => _ResponseDataWidgetState();
}

class _ResponseDataWidgetState extends State<ResponseDataWidget> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.offset > controller.position.maxScrollExtent - 200 &&
          widget.cubit.state.status == CommonStateStatus.loaded) {
        widget.cubit.paginateBooks();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.cubit.state.response?.items;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListView.separated(
        controller: controller,
        itemCount: items?.length ?? 0,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(color: AppColors.dividerColor),
        ),
        itemBuilder: (context, index) {
          final item = items![index];
          final imageUrl = item.image;

          return GestureDetector(
            // HitTestBehavior.opaque - 빈 공간까지 탭을 받고 싶을 때
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // extra로 도서 정보 모델 전달
              context.pushNamed(BookInfoPage.routerName, extra: item);
            },
            child: Row(
              children: [
                // 3) 이미지가 없거나 빈 문자열이면 대체 박스
                Hero(
                  tag: imageUrl ?? '',
                  child: SizedBox(
                    width: 75,
                    height: 115,
                    child: (imageUrl != null && imageUrl.isNotEmpty)
                        ? CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                          )
                        : const ColoredBox(color: AppColors.gray),
                  ),
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
            ),
          );
        },
      ),
    );
  }
}
