import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zewail/app/di.dart';
import 'package:zewail/core/helpers/snack_bar_helper.dart';
import 'package:zewail/core/network/error/failure.dart';
import 'package:zewail/features/course/domain/entities/category_model.dart';
import 'package:zewail/features/course/domain/usecases/get_all_categories_usecase.dart';
import 'package:zewail/features/course/domain/usecases/get_category_details_usecase.dart';

part 'categories_state.dart';

@LazySingleton()
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  final GetAllCategoriesUsecase _getAllCategoriesUsecase =
      getIt<GetAllCategoriesUsecase>();
  final GetCategoryDetailsUsecase _getCategoryDetailsUsecase =
      getIt<GetCategoryDetailsUsecase>();
  List<CategoryModel>? categories;

  getAllCategories() async {
    emit(GetCategoryLoading());
    var response = await _getAllCategoriesUsecase();
    response.fold(
      (l) {
        emit(GetCategoriesFailure(failure: l));
        SnackBarHelper.showErrorSnackBar(
            message: l.message ?? "Something went wrong"); //TODO:localization
      },
      (r) {
        categories = r;
        emit(GetCategoriesSuccess());
      },
    );
  }

  getCategoryDetails(String id) async {
    emit(GetCategoryDetailsLoading());
    var response = await _getCategoryDetailsUsecase(id);
    response.fold((l) {
      emit(GetCategoryDetailsFailure(failure: l));
    }, (r) {
      emit(GetCategoryDetailsSuccess(category: r));
    });
  }
}
