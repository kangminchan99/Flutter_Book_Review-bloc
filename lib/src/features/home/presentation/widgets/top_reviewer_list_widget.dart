import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/shared/presentation/widgets/icon_statistic_widget.dart';
import 'package:flutter/material.dart';

class TopReviewerListWidget extends StatelessWidget {
  const TopReviewerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text('TOP 10 리뷰어', style: AppTextStyle.xLargeWhiteBold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: Column(
            children: List.generate(10, (index) {
              return Container(
                height: 85,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackgroundColor,
                  borderRadius: BorderRadius.circular(85),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CircleAvatar(
                        backgroundColor: AppColors.gray,
                        radius: 32,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('닉네임', style: AppTextStyle.largeWhite),
                          Text(
                            '한 줄 설명',
                            style: AppTextStyle.mediumWhite.copyWith(
                              color: AppColors.gray,
                            ),
                          ),
                          SizedBox(height: 3),
                          Row(
                            children: [
                              IconStatisticWidget(
                                svgPath: 'assets/svg/icons/icon_journals.svg',
                                count: 10,
                              ),
                              SizedBox(width: 20),
                              IconStatisticWidget(
                                svgPath: 'assets/svg/icons/icon_people.svg',
                                count: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
