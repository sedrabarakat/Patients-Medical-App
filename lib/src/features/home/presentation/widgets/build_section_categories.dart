import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/src/features/home/presentation/widgets/section_category.dart';

import '../../../../../core/helper/dimension_manager.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/utils/style_manager.dart';
import '../cubit/category_cubit.dart';

Widget buildSectionCategories(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppString.chooseASpecialization,
            style: StyleManager.fontBold16Black,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              AppString.seeAll,
            ),
          ),
        ],
      ),
      SizedBox(
        height: DimensionsHelper.screenHeight(context)/7,
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            int selectedCategoryIndex = -1;
            if (state is CategorySelected) {
              selectedCategoryIndex = state.selectedIndex;
            }
            return ListView.separated(
              itemBuilder: (context, index) => SectionCategory(
                imageUrl: 'assets/images/heart.png',
                title: "Cardiology",
                isSelected: index == selectedCategoryIndex,
                onTap: () {
                  context.read<CategoryCubit>().selectCategory(index);
                },
              ),
              separatorBuilder: (context, index) => SizedBox(width: DimensionsHelper.screenWidth(context)/25),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            );
          },
        ),
      ),
    ],
  );
}