import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/app/di.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';
import 'package:zewail/features/course/domain/usecases/get_course_details_usecase.dart';

part 'course_details_state.dart';

@injectable
class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit() : super(CourseDetailsInitial());
  final GetCourseDetailsUsecase _getCourseDetailsUsecase =
      getIt<GetCourseDetailsUsecase>();
  CourseModel? courseDetails;
  getCourseDetails(String id) async {
    emit(CourseDetailsLoading());
    var response = await _getCourseDetailsUsecase(id);
    response.fold(
      (l) {
        emit(CourseDetailsFailure(l));
      },
      (r) {
        courseDetails = r;
        emit(CourseDetailsSuccess(r));
      },
    );
  }
}
