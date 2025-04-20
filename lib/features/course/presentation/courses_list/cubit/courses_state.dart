part of 'courses_cubit.dart';

sealed class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

final class CoursesInitial extends CoursesState {}

final class ContentLoading extends CoursesState {}

final class ContentLoadingFailure extends CoursesState {
  final Failure failure;

  const ContentLoadingFailure({required this.failure});
}

final class ContentError extends CoursesState {}

final class GetAllCoursesLoading extends CoursesState {}

final class GetAllCoursesSuccess extends CoursesState {}

final class GetCommonCoursesFailure extends CoursesState {
  final Failure failure;

  const GetCommonCoursesFailure({required this.failure});
}

final class GetAllCoursesFailure extends CoursesState {
  final Failure failure;

  const GetAllCoursesFailure({required this.failure});
}

final class GetCommonCoursesSuccess extends CoursesState {}

final class ResetParametersSuccess extends CoursesState {}
