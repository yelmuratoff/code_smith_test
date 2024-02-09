import 'package:base_starter/src/core/localization/localization.dart';
import 'package:base_starter/src/core/router/router.dart';
import 'package:base_starter/src/feature/settings/presentation/settings_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// {@template material_context}
/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
/// {@endtemplate}
class MaterialContext extends StatelessWidget {
  /// {@macro material_context}
  const MaterialContext({required this.routerConfig, super.key});

  final GoRouter routerConfig;

  // This global key is needed for [MaterialApp]
  // to work properly when Widgets Inspector is enabled.
  static final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = SettingsScope.themeOf(context).theme;
    final locale = SettingsScope.localeOf(context).locale;

    return MaterialApp.router(
      key: _globalKey,
      title: 'CodeSmith',
      onGenerateTitle: (context) => "CodeSmith",
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: theme.mode,
      localizationsDelegates: Localization.localizationDelegates,
      supportedLocales: Localization.supportedLocales,
      locale: locale,
      routerConfig: routerConfig,
      builder: (context, child) {
        child = EasyLoading.init()(context, child);
        child = MediaQuery.withClampedTextScaling(
          minScaleFactor: 1.0,
          maxScaleFactor: 2.0,
          child: child,
        );
        return child;
      },
    );
  }
}
