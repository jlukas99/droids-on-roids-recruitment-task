import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_recruitment_task/app/utils/enums.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_colors.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_dimens.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_typography.dart';

class SearchBox extends HookWidget {
  final void Function(SortType) onSelectedSort;
  final void Function(String)? onSubmitted;

  const SearchBox({Key? key, this.onSubmitted, required this.onSelectedSort}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentSortType = useState<SortType>(SortType.dsc);

    return FadeInDown(
      duration: const Duration(milliseconds: 375),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.search,
              style: AppTypography.small.copyWith(
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search_rounded),
              ),
              onSubmitted: onSubmitted,
            ),
          ),
          const SizedBox(width: AppDimens.s),
          PopupMenuButton<SortType>(
            padding: EdgeInsets.zero,
            offset: const Offset(0, AppDimens.c),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.s)),
            onSelected: (e) {
              currentSortType.value = e;
              onSelectedSort(e);
            },
            elevation: AppDimens.m,
            itemBuilder: (context) => [
              _popupButton(
                text: "A-Z",
                sortType: SortType.alphabet,
                selectedSortType: currentSortType.value,
              ),
              _popupButton(
                text: "Best",
                sortType: SortType.dsc,
                selectedSortType: currentSortType.value,
              ),
              _popupButton(
                text: "Worst",
                sortType: SortType.asc,
                selectedSortType: currentSortType.value,
              ),
            ],
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(AppDimens.s),
              ),
              padding: const EdgeInsets.all(AppDimens.xm),
              child: const Icon(Icons.filter_list_rounded),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<SortType> _popupButton(
          {required String text, required SortType sortType, required SortType selectedSortType}) =>
      PopupMenuItem(
        value: sortType,
        child: Text(
          text,
          style: AppTypography.small.copyWith(color: sortType == selectedSortType ? AppColors.primary : null),
        ),
      );
}
