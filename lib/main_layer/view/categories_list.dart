import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/common/presentation/widgets/networkImage/network_image.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/core/extensions/localization_extensions.dart';
import 'package:zewail/features/course/domain/entities/category_model.dart';
import 'package:zewail/features/course/presentation/categories/cubit/categories_cubit.dart';
import 'package:zewail/main_layer/widgets/list_title_widget.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTitleWidget(title: context.localization.categoryNAme),
        SizedBox(
          height: 24.h,
        ),
        BlocBuilder<CategoriesCubit, CategoriesState>(
          buildWhen: (previous, current) {
            return current is GetCategoryLoading ||
                current is GetCategoriesSuccess ||
                current is GetCategoriesFailure;
          },
          builder: (context, state) {
            if (context.watch<CategoriesCubit>().categories.isEmpty &&
                state is GetCategoryLoading) {
              return SizedBox(
                height: 160.h,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (context.watch<CategoriesCubit>().categories.isEmpty &&
                state is! GetCategoryLoading) {
              return SizedBox();
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: divideCategoryList(
                              context.watch<CategoriesCubit>().categories, 1)
                          .map(
                            (item) => SizedBox(
                              width: 90.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 22.r,
                                    backgroundColor: AppColors.mainColor
                                        .withValues(alpha: .1),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CustomImageWidget(
                                        imagePath: item.image ?? '',
                                        height: 20.h,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    item.name ?? '',
                                    maxLines: 2,
                                    style: CustomTextStyle.styleW500S12Black,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: divideCategoryList(
                              context.watch<CategoriesCubit>().categories, 2)
                          .map(
                            (item) => SizedBox(
                              width: 90.w,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 22.r,
                                    backgroundColor: AppColors.mainColor
                                        .withValues(alpha: .1),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CustomImageWidget(
                                        imagePath: item.image ?? '',
                                        height: 20.h,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    item.name ?? '',
                                    maxLines: 2,
                                    style: CustomTextStyle.styleW500S12Black,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }

  List<CategoryModel> divideCategoryList(
      List<CategoryModel> list, int itemNumber) {
    int mid = (list.length / 2).ceil();

    if (itemNumber == 1) {
      return list.sublist(0, mid);
    } else {
      return list.sublist(mid);
    }
  }
}
