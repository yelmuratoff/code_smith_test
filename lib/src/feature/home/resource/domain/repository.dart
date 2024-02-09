import 'package:base_starter/src/feature/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract interface class FormRepository {
  Future<void> refresh(RefreshHomeEvent event, Emitter<HomeState> emit);
}
