part of 'course_details_cubit.dart';

sealed class CourseDetailsState extends Equatable {
  const CourseDetailsState();

  @override
  List<Object> get props => [];
}

final class CourseDetailsInitial extends CourseDetailsState {}

final class CourseDetailsLoading extends CourseDetailsState {}

final class CourseDetailsSuccess extends CourseDetailsState {
  final CourseModel course;

  const CourseDetailsSuccess(this.course);

  @override
  List<Object> get props => [course];
}

final class CourseDetailsFailure extends CourseDetailsState {
  final Failure failure;

  const CourseDetailsFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
