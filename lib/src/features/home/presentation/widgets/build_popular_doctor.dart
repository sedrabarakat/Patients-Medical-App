import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/domain/services/locator.dart';
import '../../../../../core/helper/color_helper.dart';
import '../cubit/home_cubit.dart';
import 'doctor_card.dart';

class BuildPopularDoctor extends StatelessWidget {
  final int sectionId ;
  const BuildPopularDoctor({super.key, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: getIt<HomeCubit>()..getSectionInformation(sectionId),
        child: Builder(builder: (context) {
          return Padding(
              padding:const EdgeInsets.all(30),
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<HomeCubit, HomeState>(
                      buildWhen: (previous, current) {
                        if (current is GetSectionInformationLoadingState &&
                            previous is GetSectionInformationSuccessState) {
                          return false;
                        } else if (current
                        is GetSectionInformationLoadingState &&
                            previous is GetSectionInformationLoadingState) {
                          return false;
                        }
                        if (current is GetSectionInformationErrorState) {
                          return true;
                        } else if (current
                        is GetSectionInformationLoadingState) {
                          return true;
                        } else if (current
                        is GetSectionInformationSuccessState) {
                          return true;
                        } else if (previous
                        is GetSectionInformationSuccessState) {
                          return true;
                        }
                        return false;
                      },
                      builder: (context, state) {
                        if (state is GetSectionInformationSuccessState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => DoctorCard(
                                  doctor: state.section.doctor![index],
                                ),
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 8,
                                ),
                                itemCount: state.section.doctor!.length,
                                shrinkWrap: true,
                              ),
                            ],
                          );
                        } else if (state is GetSectionInformationLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: ColorsHelper.blue,
                            ),
                          );
                        } else if (state is GetSectionInformationErrorState) {
                          return Center(
                            child: Text(
                                NetworkExceptions.getErrorMessage(state.error)),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            );
        }),
      );
  }
}

// Widget buildPopularDoctors(List<Doctor> doctors) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Popular Doctors",
//             style: StyleManager.fontBold16Black,
//           ),
//           TextButton(
//             onPressed: () {},
//             child: const Text(
//               AppString.seeAll,
//             ),
//           ),
//         ],
//       ),
//       ListView.separated(
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) => DoctorCard(
//           doctor: doctors[index],
//         ),
//         separatorBuilder: (context, index) => const SizedBox(
//           height: 8,
//         ),
//         itemCount: doctors.length,
//         shrinkWrap: true,
//       ),
//     ],
//   );

