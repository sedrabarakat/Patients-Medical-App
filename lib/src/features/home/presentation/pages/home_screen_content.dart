import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/src/features/home/presentation/widgets/scroll_page_view.dart';
import '../../../../../core/utils/padding_manager.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../domain/repositories/doctor_repository.dart';
import '../cubit/home_cubit.dart';
import '../widgets/build_popular_doctor.dart';
import '../widgets/build_section_categories.dart';
import '../widgets/header.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(DoctorRepository())..fetchDoctor(),
          ),
        ],
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is LoadingHome) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedHome) {
              return Padding(
                padding: AppPadding.screenPaddingAll,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: DimensionsHelper.heightPercentage(context, 4),
                            bottom:
                                DimensionsHelper.heightPercentage(context, 2)),
                        child: const Header(),
                      ),
                      AutoScrollPageView(doctors: state.doctors),
                      Gap(DimensionsHelper.heightPercentage(context, 2)),
                      const SectionCategories(),
                      buildPopularDoctors(state.doctors),
                    ],
                  ),
                ),
              );
            } else if (state is ErrorHome) {
              return const Center(child: Text(AppString.failedToLoadDoctors));
            }
            return const Center(child: Text(AppString.empty));
          },
        ),
      ),
    );
  }
}
