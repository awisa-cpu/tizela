import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';
import 'package:tizela/utils/constants/app_colors.dart';

class CustomSliverAndTabBarView extends StatelessWidget {
  final TabBarView tabBarView;
  final List<Widget> tabs;
  final bool? shouldCenterTitle, shouldImplyLeading;
  final bool shouldShowHeader;
  final String? title;
  final bool? isScrollable;
  final EdgeInsetsGeometry? padding;
  final TabAlignment? tabAlignment;
  final int? length;
  const CustomSliverAndTabBarView({
    super.key,
    required this.tabBarView,
    required this.tabs,
    this.shouldShowHeader = true,
    this.shouldCenterTitle = true,
    this.shouldImplyLeading = true,
    this.title,
    this.isScrollable,
    this.padding,
    this.tabAlignment,
    this.length,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length ?? 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: AppColors.appWhiteColor,
                automaticallyImplyLeading: shouldImplyLeading ?? false,
                centerTitle: shouldCenterTitle,
                title: shouldShowHeader
                    ? Text(
                        title ?? "Search",
                        style: customTextStyle(fontSize: 16),
                      )
                    : null,
                bottom: TabBar(
                  padding: padding,
                  tabAlignment: tabAlignment,
                  isScrollable: isScrollable ?? false,
                  labelPadding: const EdgeInsets.all(12),
                  enableFeedback: false,
                  tabs: tabs,
                ),
              )
            ];
          },
          body: tabBarView,
        ),
      ),
    );
  }
}
