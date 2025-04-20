part of 'categories_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class GetCategoryLoading extends CategoriesState {}

final class GetCategoriesSuccess extends CategoriesState {}

final class GetCategoryDetailsLoading extends CategoriesState {}

final class GetCategoryDetailsSuccess extends CategoriesState {
  final CategoryModel category;

  const GetCategoryDetailsSuccess({required this.category});

  @override
  List<Object> get props => [category];
}

final class GetCategoryDetailsFailure extends CategoriesState {
  final Failure failure;

  const GetCategoryDetailsFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}

final class GetCategoriesFailure extends CategoriesState {
  final Failure failure;

  const GetCategoriesFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}
