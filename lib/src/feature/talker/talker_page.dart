import 'package:base_starter/src/core/router/router.dart';
import 'package:base_starter/src/feature/talker/talker_view.dart' as view;
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// UI view for output of all Talker logs and errors
class TalkerPage extends StatelessWidget {
  const TalkerPage({
    required this.talker,
    super.key,
    this.appBarTitle = 'Logger',
    this.theme = const TalkerScreenTheme(),
    this.itemsBuilder,
  });

  static const String name = "Logger";
  static const String routePath = "logger";

  static const String paramTalker = "paramTalker";
  static const String paramTheme = "paramTheme";
  static const String paramTitle = "paramTitle";
  static const String paramItemBuilder = "paramItemBuilder";

  /// Talker implementation
  final Talker talker;

  /// Theme for customize [TalkerScreen]
  final TalkerScreenTheme theme;

  /// Screen [AppBar] title
  final String appBarTitle;

  /// Optional Builder to customize
  /// log items cards in list
  final TalkerDataBuilder? itemsBuilder;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: theme.backgroundColor,
        body: view.TalkerView(
          talker: talker,
          theme: theme,
          appBarTitle: appBarTitle,
          appBarLeading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
      );
}
