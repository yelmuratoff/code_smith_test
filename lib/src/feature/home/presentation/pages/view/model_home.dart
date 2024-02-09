import 'package:base_starter/src/core/services/page_model.dart';
import 'package:flutter/material.dart';

final class ModelHomePage extends PageModel {
  late final TabController tabController;
  late final ScrollController rawScrollController;
  late final ScrollController renderedScrollController;
  @override
  void initState(BuildContext context) {
    rawScrollController = ScrollController();
    renderedScrollController = ScrollController();
  }

  @override
  void dispose() {
    tabController.dispose();
    rawScrollController.dispose();
    renderedScrollController.dispose();
  }
}
