import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/common/presentation/widgets/networkImage/network_image.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/routes.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/features/course/presentation/categories/cubit/categories_cubit.dart';
import 'package:zewail/main_layer/widgets/list_title_widget.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    var categories = context.watch<CategoriesCubit>().categories;
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is GetCategoryLoading) {
          return SizedBox(
            height: 160.h,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return ((categories ?? []).isEmpty)
              ? SizedBox()
              : Column(
                  spacing: 24.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTitleWidget(title: 'الاقسام'), //TODO:localization,

                    SizedBox(
                      height: 160.h,
                      child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisSpacing: 10.w),
                          itemCount: categories!.length,
                          itemBuilder: (context, index) {
                            var category = categories[index];
                            return GestureDetector(
                              onTap: () => context.pushNamed(
                                  Routes.categoryDetailsPage,
                                  extra: category.id),
                              child: Column(
                                spacing: 6.h,
                                children: [
                                  CircleAvatar(
                                    radius: 22.r,
                                    backgroundColor: AppColors.mainColor
                                        .withValues(alpha: .1),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CustomImageWidget(
                                        imagePath: category.image ?? '',
                                        height: 20.h,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      category.name ?? '',
                                      style: CustomTextStyle.styleW500S12Black,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                );
        }
      },
    );
  }
}
