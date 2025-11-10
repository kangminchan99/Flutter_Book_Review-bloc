import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/review/presentation/cubit/review_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewContentWidget extends StatefulWidget {
  final String? initReview;
  const ReviewContentWidget({super.key, this.initReview});

  @override
  State<ReviewContentWidget> createState() => _ReviewContentWidgetState();
}

class _ReviewContentWidgetState extends State<ReviewContentWidget> {
  TextEditingController controller = TextEditingController();

  @override
  void didUpdateWidget(covariant ReviewContentWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.text = widget.initReview ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: context.read<ReviewCubit>().changeReview,
      style: AppTextStyle.largeWhite,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '리뷰를 작성해 주세요.',
        contentPadding: const EdgeInsets.symmetric(horizontal: 25.0),
        hintStyle: AppTextStyle.largeWhite.copyWith(color: AppColors.gray),
      ),
    );
  }
}
