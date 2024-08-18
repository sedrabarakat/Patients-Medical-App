import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/patient_cubit.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/patient_state.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/empty_data_widget.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/list_of_files.dart';

class CustomTabBarView extends StatefulWidget {
  const CustomTabBarView({super.key});

  @override
  State<CustomTabBarView> createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView>
    with TickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientCubit, PatientState>(
      buildWhen: (previous, current) {
        if (current is GetSessionLoadingState ||
            current is GetSessionErrorState ||
            current is GetSessionSuccessState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        PatientCubit cubit = BlocProvider.of<PatientCubit>(context);
        _controller = cubit.getTabController(this);
        return cubit.tabs.isEmpty
            ? const Expanded(
                child: Center(
                  child: EmptyDataWidget(
                    label: "There is no session details here 😰",
                  ),
                ),
              )
            : Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: AppSize.size20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TabBar(
                      tabAlignment:
                          cubit.tabs.length > 5 ? TabAlignment.start : null,
                      dragStartBehavior: DragStartBehavior.start,
                      isScrollable: cubit.tabs.length > 5 ? true : false,
                      controller: _controller,
                      unselectedLabelColor: ColorsHelper.lighGrey,
                      labelColor: Colors.black,
                      indicatorColor: ColorsHelper.primary,
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: AppSize.size20,
                        vertical: AppSize.size10,
                      ),
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: List.generate(
                        cubit.tabs.length,
                        (index) => Text(
                          cubit.tabs[index].tabName,
                        ),
                      ),
                      onTap: (index) {
                        _controller!.animateTo(index);
                        cubit.selectedTabIndex = index;
                        cubit.getSessionDetailsInformation(
                            cubit.tabs[index].sessionDetails.id);
                      },
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _controller,
                        children: List.generate(
                          cubit.tabs.length,
                          (index) {
                            return BlocBuilder<PatientCubit, PatientState>(
                                buildWhen: (previous, current) {
                              if (current
                                      is GetSessionDetailsInformationErrorState &&
                                  current.sessionDetailsId ==
                                      cubit.tabs[index].id) {
                                return true;
                              } else if (current
                                      is GetSessionDetailsInformationSuccessState &&
                                  current.sessionDetailsId ==
                                      cubit.tabs[index].id) {
                                return true;
                              } else if (current
                                      is GetSessionDetailsInformationLoadingState &&
                                  current.sessionDetailsId ==
                                      cubit.tabs[index].id) {
                                return true;
                              } else {
                                return false;
                              }
                            }, builder: (context, state) {
                              if (state
                                  is GetSessionDetailsInformationLoadingState) {
                                return const Expanded(
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: ColorsHelper.primary,
                                    ),
                                  ),
                                );
                              } else if (state
                                  is GetSessionDetailsInformationSuccessState) {
                                if (state.sessionDetails.files.isEmpty) {
                                  return const Expanded(
                                    child: Center(
                                      child: EmptyDataWidget(
                                        label: "There is no files 😭",
                                      ),
                                    ),
                                  );
                                } else {
                                  return ListOfFiles(
                                    files: state.sessionDetails.files,
                                    sessionDetailsId: state.sessionDetails.id,
                                    doctor: state.doctor,
                                  );
                                }
                              } else if (state
                                  is GetSessionDetailsInformationErrorState) {
                                return Text(NetworkExceptions.getErrorMessage(
                                    state.error));
                              } else {
                                return const SizedBox();
                              }
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
