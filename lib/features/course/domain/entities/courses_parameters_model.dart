/*
data_search=2024-08-01&category_id=2&most_popular=1

 */

class CoursesParametersModel {
  final String? dataSearch;
  final String? categoryId;
  final bool? mostPopular;

  CoursesParametersModel({
    this.dataSearch,
    this.categoryId,
    this.mostPopular,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dataSearch != null) data['data_search'] = dataSearch;
    if (categoryId != null) data['category_id'] = categoryId;
    if (mostPopular != null) {
      data['most_popular'] = mostPopular! ? 1 : 0;
    }
    return data;
  }

  CoursesParametersModel copyWith({
    String? dataSearch,
    String? categoryId,
    bool? mostPopular,
  }) {
    return CoursesParametersModel(
      dataSearch: dataSearch ?? this.dataSearch,
      categoryId: categoryId ?? this.categoryId,
      mostPopular: mostPopular ?? this.mostPopular,
    );
  }
}
