import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/home/cubit/recent_review_cubit.dart';
import 'package:bookreview/src/features/home/presentation/widgets/recent_review_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentReviewListWidget extends StatelessWidget {
  const RecentReviewListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('최신 리뷰', style: AppTextStyle.xLargeWhiteBold),
              Text(
                '더보기',
                style: AppTextStyle.mediumWhite.copyWith(
                  color: AppColors.btnBackgroundColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: BlocBuilder<RecentReviewCubit, RecentReviewState>(
              builder: (context, state) {
                return PageView.builder(
                  // viewportFraction: 0.5 : 한 화면에 보이는 아이템의 비율 설정 0.5면 2개 씩 보임
                  controller: PageController(viewportFraction: 0.45),
                  // padEnds - false : 첫 번째 아이템과 마지막 아이템가 좌우 끝에 붙도록 설정 true일 경우 중앙 정렬
                  padEnds: false,
                  itemCount: state.results?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 25),
                      child: RecentReviewItemWidget(
                        bookReviewInfoModel: state.results![index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
