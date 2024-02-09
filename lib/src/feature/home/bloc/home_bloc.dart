import 'package:base_starter/src/feature/home/resource/domain/models/form_model.dart';
import 'package:base_starter/src/feature/home/resource/domain/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FormRepository repository;
  HomeBloc({required this.repository}) : super(const InitialHomeState()) {
    on<HomeEvent>(
      (event, emit) => event.map(
        refresh: (event) => repository.refresh(event, emit),
      ),
    );
  }
}

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.refresh() = RefreshHomeEvent;
}

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = InitialHomeState;
  const factory HomeState.loading() = LoadingHomeState;
  const factory HomeState.fetched({
    required FormModel forms,
    required Map<String, dynamic> data,
  }) = FetchedHomeState;
  const factory HomeState.failure({
    required Object cause,
  }) = FailureHomeState;
}
