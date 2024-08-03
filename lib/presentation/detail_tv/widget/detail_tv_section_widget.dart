import 'package:flutter/material.dart';
import 'package:huynd2_assignment/domain/tv_show_detail/enitty/tv_detail_entity.dart';
import 'package:huynd2_assignment/presentation/detail_tv/widget/about_widget_section.dart';
import 'package:huynd2_assignment/presentation/detail_tv/widget/app_bar_section_widget.dart';
import 'package:huynd2_assignment/presentation/detail_tv/widget/episode_widget_section.dart';
import 'package:huynd2_assignment/presentation/detail_tv/widget/header_tab_bar_widget.dart';
import 'package:huynd2_assignment/presentation/detail_tv/widget/review_section_widget.dart';
import 'package:huynd2_assignment/presentation/detail_tv/widget/similar_tv_show_section_widget.dart';


class DetailTVSectionWidget extends StatelessWidget {
  const DetailTVSectionWidget({
    super.key,
    required this.tvDetail,
    required this.lastAirYear,
  });

  final TVDetailEntity tvDetail;
  final String lastAirYear;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(
        slivers: [
          AppBarSectionWidget(tvDetail: tvDetail, lastAirYear: lastAirYear),
          const HeaderTabBarWidget(),
          SliverFillRemaining(
            child: TabBarView(
              children: [
                EpisodeSectionWidget(tvDetailEntity: tvDetail),
                SimilarTvShowSectionWidget(tvDetailEntity: tvDetail),
                AboutSectionWidget(tvDetailEntity: tvDetail),
                ReviewSectionWidget(tvDetailEntity: tvDetail),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
