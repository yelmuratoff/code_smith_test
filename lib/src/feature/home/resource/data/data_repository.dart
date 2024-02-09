import 'package:base_starter/src/core/resource/data/api/data_http.dart';
import 'package:base_starter/src/core/utils/talker_logger.dart';
import 'package:base_starter/src/feature/home/bloc/home_bloc.dart';
import 'package:base_starter/src/feature/home/resource/domain/models/form_model.dart';
import 'package:base_starter/src/feature/home/resource/domain/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class FormRepositoryImpl implements FormRepository {
  @override
  Future<void> refresh(RefreshHomeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeState.loading());

      final response = await HttpQuery().get(
        url: "forms",
      );
      if (response is DioException) {
        final DioException e = response;
        talker.handle(e, e.stackTrace);
        emit(HomeState.failure(cause: e));
        return;
      } else {
        emit(
          HomeState.fetched(
            forms: FormModel.fromJson(response as Map<String, dynamic>),
            data: response,
          ),
        );
      }
    } on Exception catch (e, st) {
      talker.handle(e, st);
      emit(HomeState.failure(cause: e));
    }
  }
}
