import 'package:flutter/material.dart';
import 'package:huynd2_assignment/manager/utils/utils.dart';
import 'package:huynd2_assignment/presentation/explore/result_of_search_by_keyword.dart';

class ButtonShowDialogFilterWidget extends StatelessWidget {
  const ButtonShowDialogFilterWidget({
    super.key,
    required this.widget,
  });

  final ResultMovieOfSearchByKeyword widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.tune_rounded),
      onPressed: () {
        AppUtils.showFilterDialog(context, widget.keywordSearched ?? '');
      },
    );
  }
}
