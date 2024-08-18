import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/src/features/home/presentation/widgets/scroll_page_view.dart';
import '../../../../../core/utils/padding_manager.dart';
import '../../../../../core/utils/string_manager.dart';
import '../cubit/home_cubit.dart';
import '../widgets/build_popular_doctor.dart';
import '../widgets/build_section_categories.dart';
import '../widgets/header.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      body: BlocProvider(
          create: (context) => getIt.get<HomeCubit>()..getSliders()..getSections(),
          child: Builder(builder: (context) {
            return BlocBuilder<HomeCubit, HomeState>(
              // buildWhen: (previous, current) {
              //   if (current is SectionCategorySelected) {
              //     return true;
              //   } else if (current is GetSectionInformationLoadingState) {
              //     return true;
              //   } else if (current is GetSectionInformationErrorState) {
              //     return true;
              //   } else if (current is GetSectionInformationSuccessState) {
              //     return true;
              //   } else if (current is GetSectionsSuccessState) {
              //     return true;
              //   } else if (current is GetSectionsErrorState) {
              //     return true;
              //   } else if (current is GetSectionsLoadingState) {
              //     return true;
              //   } else {
              //     return false;
              //   }
              // },
              builder: (context, state) {
                if (state is LoadingHome || state is Loading_getPatientInfo) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadedHome ||
                    state is GetSectionsSuccessState||
                    state is Success_getPatientInfo) {
                  return Padding(
                    padding: AppPadding.screenPaddingAll,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: DimensionsHelper.heightPercentage(
                                    context, 4),
                                bottom: DimensionsHelper.heightPercentage(
                                    context, 2)),
                            child: BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                return Header(
                                  patient: HomeCubit.patientModel!,
                                );


                              },
                            ),
                          ),
                          BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              if (state is GetSlidersSuccessState) {
                                return AutoScrollPageView(
                                    sliders: state.sliders);
                              }
                              return const AutoScrollPageView(sliders: []);
                            },
                          ),
                          Gap(DimensionsHelper.heightPercentage(context, 2)),
                          BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              if (state is GetSectionsSuccessState) {
                                return SectionCategories(
                                    sectionModels: context.read<HomeCubit>().sections);
                              } else if (state is GetSectionsLoadingState) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is GetSectionsErrorState) {
                                return Center(
                                    child: Text('Error: ${state.error}'));
                              } else {
                                return const SizedBox(); // Default placeholder widget (empty)
                              }
                            },
                          ),
                          BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                            if (state is SectionCategorySelected) {
                              BuildPopularDoctor(
                                sectionId: state.selectedSectionCategoryIndex,
                              );
                            }
                            return Text('');
                          }),
                        ],
                      ),
                    ),
                  );
                } else if (state is ErrorHome) {
                  return const Center(
                      child: Text(AppString.failedToLoadDoctors));
                }
                return const Center(child: Text(AppString.empty));
              },
            );
          })),
    );
  }
}
