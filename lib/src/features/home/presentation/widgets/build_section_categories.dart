import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/data/models/section_model.dart';
import 'package:patient_app/core/languages/app_localizations.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:patient_app/src/features/home/presentation/widgets/section_category.dart';
import '../../../../../core/helper/dimension_manager.dart';
import '../../../../../core/utils/style_manager.dart';

class SectionCategories extends StatefulWidget {
  final List<SectionModel>  sectionModels ;
  const SectionCategories({super.key, required this.sectionModels});

  @override
  State<SectionCategories> createState() => _SectionCategoriesState();
}

class _SectionCategoriesState extends State<SectionCategories> {
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.chooseSpecialization,
              style: StyleManager.fontBold16Black,
            ),
            TextButton(
              onPressed: () {
                context.push(AppRouter.kSelectAppointment);
              },
              child: Text(
                AppLocalizations.of(context)!.seeAll,
              ),
            ),
          ],
        ),
        SizedBox(
          height: DimensionsHelper.screenHeight(context) / 7,
          child: ListView.separated(
            itemBuilder: (context, index) => SectionCategory(
              imageUrl: widget.sectionModels[index].image,
              title: widget.sectionModels[index].sectionName,
              isSelected: index == selectedCategoryIndex,
              onTap: () {
                setState(
                  () {
                    selectedCategoryIndex = index;
                    BlocProvider.of<HomeCubit>(context).selectedSection =
                        selectedCategoryIndex;
                  },
                );
              },
            ),
            separatorBuilder: (context, index) =>
                SizedBox(width: DimensionsHelper.screenWidth(context) / 25),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
