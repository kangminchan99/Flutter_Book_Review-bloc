import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewSliderBarWidget extends StatefulWidget {
  final double initValue;
  final void Function(double value) onChange;
  const ReviewSliderBarWidget({
    super.key,
    this.initValue = 0,
    required this.onChange,
  });

  @override
  State<ReviewSliderBarWidget> createState() => _ReviewSliderBarState();
}

class _ReviewSliderBarState extends State<ReviewSliderBarWidget> {
  final GlobalKey _parentKey = GlobalKey();

  final double _thumbSize = 22; // 별 크기
  double position = 0;
  double minX = 0;
  double maxX = 0;
  double trackWidth = 0;
  double value = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final parentContext = _parentKey.currentContext;
      if (parentContext != null) {
        final box = parentContext.findRenderObject() as RenderBox?;
        final parentWidth = box!.size.width;

        setState(() {
          minX = _thumbSize / 2; // 11
          maxX = parentWidth - _thumbSize / 2; // parentWidth - 11
          trackWidth = maxX - minX;

          _initValue();
        });
      }
    });
  }

  void _initValue() {
    if (trackWidth == 0) return;
    value = widget.initValue;
    position = minX + (value / 10) * trackWidth;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _parentKey, // 전체 영역 기준
      height: 45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            value.toStringAsFixed(2),
            style: AppTextStyle.largeWhite.copyWith(
              color: AppColors.btnBackgroundColor,
            ),
          ),
          Expanded(
            child: Listener(
              behavior: HitTestBehavior.translucent,
              onPointerDown: (event) {
                if (trackWidth == 0) return;
                final dx = event.localPosition.dx;
                setState(() {
                  position = dx.clamp(minX, maxX);
                  value = ((position - minX) / trackWidth) * 10;
                });
                widget.onChange(value);
              },
              child: Stack(
                children: [
                  // 회색 바: minX ~ maxX 까지만
                  Positioned(
                    left: minX,
                    top: 9,
                    width: trackWidth,
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff434343),
                      ),
                    ),
                  ),
                  // 노란 바: minX ~ position
                  Positioned(
                    left: minX,
                    top: 9,
                    width: trackWidth == 0
                        ? 0
                        : (position - minX).clamp(0, trackWidth),
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF4AA2B),
                      ),
                    ),
                  ),
                  // 별
                  Positioned(
                    top: 0,
                    left: position - _thumbSize / 2,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        if (trackWidth == 0) return;
                        setState(() {
                          position = (position + details.delta.dx).clamp(
                            minX,
                            maxX,
                          );
                          value = ((position - minX) / trackWidth) * 10;
                        });
                        widget.onChange(value);
                      },
                      child: SvgPicture.asset(
                        'assets/svg/icons/icon_star.svg',
                        width: _thumbSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
