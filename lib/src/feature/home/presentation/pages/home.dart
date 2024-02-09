import 'dart:convert';

import 'package:base_starter/src/core/router/router.dart';
import 'package:base_starter/src/core/services/page_model.dart';
import 'package:base_starter/src/core/utils/extensions/context_extension.dart';
import 'package:base_starter/src/core/utils/extensions/scroll_physics.dart';
import 'package:base_starter/src/core/utils/talker_logger.dart';
import 'package:base_starter/src/core/views/widgets/json_viewer.dart';
import 'package:base_starter/src/feature/home/presentation/pages/view/model_home.dart';
import 'package:base_starter/src/feature/settings/presentation/settings.dart';
import 'package:base_starter/src/feature/talker/talker_page.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'view/home_page.dart';
part '../widgets/raw_body.dart';
part '../widgets/rendered_body.dart';
