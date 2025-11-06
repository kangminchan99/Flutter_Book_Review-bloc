import 'package:bookreview/src/features/search_book/presentation/cubit/search_book_cubit.dart';
import 'package:bookreview/src/features/search_book/presentation/widgets/response_data_widget.dart';
import 'package:bookreview/src/features/search_book/presentation/widgets/response_state_view_widget.dart';
import 'package:bookreview/src/shared/domain/entities/common_state_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponseViewWidget extends StatelessWidget {
  const ResponseViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<SearchBookCubit>();
    if (cubit.state.status == CommonStateStatus.init) {
      return ResponseStateViewWidget(title: '리뷰 할 책을 찾아보세요');
    } else if (cubit.state.status == CommonStateStatus.loaded &&
        (cubit.state.response == null ||
            cubit.state.response!.items!.isEmpty)) {
      return ResponseStateViewWidget(title: '검색 결과가 없습니다');
    }
    return ResponseDataWidget(cubit: cubit);
  }
}
