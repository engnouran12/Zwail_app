import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/app/di.dart';
import 'package:zewail/core/helpers/snack_bar_helper.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';
import 'package:zewail/features/course/domain/entities/courses_parameters_model.dart';
import 'package:zewail/features/course/domain/usecases/get_courses_filtered_usecase.dart';

part 'courses_state.dart';

@injectable
class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());

  final GetCoursesFilteredUsecase _getCoursesUsecase =
      getIt<GetCoursesFilteredUsecase>();
  List<CourseModel> commonCourses = [];
  List<CourseModel> courses = [];
  List<CourseModel> allCoursesFiltered = [];
  CoursesParametersModel allCoursesParameters = CoursesParametersModel();
  getCommonCourses() async {
    emit(ContentLoading());
    var response =
        await _getCoursesUsecase(CoursesParametersModel(mostPopular: true));
    response.fold(
      (l) {
        emit(ContentLoadingFailure(failure: l));
        SnackBarHelper.showErrorSnackBar(message: l.message ?? '');
      },
      (r) {
        print('XXXX->${r.length}');
        commonCourses = r;
        emit(GetCommonCoursesSuccess());
      },
    );
  }

  getAllCourses() async {
    emit(ContentLoading());

    var response = await _getCoursesUsecase(allCoursesParameters);
    response.fold(
      (l) {
        emit(ContentLoadingFailure(failure: l));
        SnackBarHelper.showErrorSnackBar(message: l.message ?? '');
      },
      (r) {
        print('XXXX->${r.length}');
        courses = r;
        emit(GetAllCoursesSuccess());
      },
    );
  }

  getAllCoursesFiltered({bool? mostPopular}) async {
    print('XXXXX${mostPopular}');
    allCoursesParameters =
        allCoursesParameters.copyWith(mostPopular: mostPopular);
    emit(GetAllCoursesLoading());

    var response = await _getCoursesUsecase(allCoursesParameters);
    response.fold(
      (l) {
        emit(GetAllCoursesFailure(failure: l));
      },
      (r) {
        print('XXXX->${r.length}');
        allCoursesFiltered = r;
        emit(GetAllCoursesSuccess());
      },
    );
  }

  resetParameters() {
    print('XXXXXX');
    allCoursesParameters = CoursesParametersModel();
    emit(ResetParametersSuccess());
  }
}
