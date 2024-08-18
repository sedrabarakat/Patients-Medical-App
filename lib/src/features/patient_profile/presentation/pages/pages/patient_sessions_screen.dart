import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/helper/time_helper.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/patient_cubit.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/cubit/patient_state.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/empty_data_widget.dart';
import 'package:patient_app/src/features/patient_profile/presentation/pages/pages/widgets/session_card.dart';

class PatientSessionsScreen extends StatefulWidget {
  const PatientSessionsScreen({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<PatientSessionsScreen> createState() => _PatientSessionsScreenState();
}

class _PatientSessionsScreenState extends State<PatientSessionsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.data['cubit'] as PatientCubit,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Patient Sessions",
              style: StyleManager.fontMedium18.copyWith(
                color: ColorsHelper.black,
              ),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorsHelper.black,
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorsHelper.primary,
              ),
              dividerColor: ColorsHelper.lighGrey,
              labelColor: ColorsHelper.white,
              unselectedLabelColor: ColorsHelper.black,
              indicatorPadding: const EdgeInsets.only(bottom: 10),
              tabs: const [
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSize.size20,
                    right: AppSize.size20,
                    top: AppSize.size10,
                    bottom: AppSize.size20,
                  ),
                  child: Text(
                    "Archive",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSize.size20,
                    right: AppSize.size20,
                    top: AppSize.size10,
                    bottom: AppSize.size20,
                  ),
                  child: Text(
                    'Opened',
                  ),
                ),
              ],
              onTap: (index) => _tabController.animateTo(index),
            ),
          ),
          body: BlocBuilder<PatientCubit, PatientState>(
            buildWhen: (previous, current) {
              if (current is GetPatientSessionsLoadingState ||
                  current is GetPatientSessionsErrorState ||
                  current is GetpatientSessionsSuccessState) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              if (state is GetPatientSessionsLoadingState) {
                //todo add the shimmer effect
                return const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ColorsHelper.primary,
                    ),
                  ),
                );
              } else if (state is GetpatientSessionsSuccessState) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    state.closedSession.isNotEmpty
                        ? ListView.separated(
                            padding:
                                const EdgeInsets.all(AppSize.screenPadding),
                            itemBuilder: (context, index) => SessionCard(
                              onTap: () {
                                BlocProvider.of<PatientCubit>(context)
                                    .getSession(state.openedSession[index].id);
                                context.push(
                                  AppRouter.kSessionInformation,
                                  extra: {
                                    'cubit': widget.data['cubit'],
                                    'session': state.openedSession[index],
                                  },
                                );
                              },
                              isOpen: false,
                              date: state.closedSession[index].createdDate,
                              time: TimeHelper.timeStampToLocal(
                                  state.closedSession[index].createdTimeStamp),
                              price: state.closedSession[index].total,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: AppSize.size10,
                            ),
                            itemCount: state.closedSession.length,
                          )
                        : const Expanded(
                            child: Center(
                              child: EmptyDataWidget(
                                  label:
                                      "There is no archive for this patient"),
                            ),
                          ),
                    state.openedSession.isNotEmpty
                        ? ListView.separated(
                            padding:
                                const EdgeInsets.all(AppSize.screenPadding),
                            itemBuilder: (context, index) => SessionCard(
                              onTap: () {
                                BlocProvider.of<PatientCubit>(context)
                                    .getSession(state.openedSession[index].id);
                                context.push(
                                  AppRouter.kSessionInformation,
                                  extra: {
                                    'cubit': widget.data['cubit'],
                                    'session': state.openedSession[index],
                                  },
                                );
                              },
                              isOpen: true,
                              date: state.openedSession[index].createdDate,
                              time: TimeHelper.timeStampToLocal(
                                  state.openedSession[index].createdTimeStamp),
                              price: state.openedSession[index].total,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: AppSize.size10,
                            ),
                            itemCount: state.openedSession.length,
                          )
                        : const Expanded(
                            child: Center(
                              child: EmptyDataWidget(
                                label:
                                    "There is no opened Session for this patient",
                              ),
                            ),
                          ),
                  ],
                );
              } else {
                //todo add the error widget
                return const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text("Something went wrong"),
                  ),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
