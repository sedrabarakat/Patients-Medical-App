import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/routing/app_router.dart';
import 'package:patient_app/core/utils/assets_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';
import 'package:patient_app/core/widgets/custom_progress_state_button.dart';
import 'package:patient_app/src/features/doctor_profile/presentation/pages/widget/text_with_icon.dart';
import 'package:patient_app/src/features/favoriate/presentation/cubit/fav_cubit.dart';
import 'package:patient_app/src/features/favoriate/presentation/cubit/fav_states.dart';
import 'package:progress_state_button/progress_button.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    DoctorModel doctor = data['doctor'];
    return BlocProvider.value(
      value: data['cubit'] as FavCubit,
      child: Builder(builder: (context) {
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  width: double.infinity,
                  height: DimensionsHelper.heightPercentage(context, 35),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: doctor.user.image != null
                          ? NetworkImage(doctor.user.image!)
                          : const AssetImage(
                              AssetsManager.profileImage,
                            ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: ColorsHelper.black,
                  ),
                ),
                Positioned(
                  top: DimensionsHelper.heightPercentage(context, 32),
                  child: Expanded(
                    child: Container(
                      width: DimensionsHelper.widthPercentage(context, 100),
                      height: DimensionsHelper.heightPercentage(context, 68),
                      decoration: const BoxDecoration(
                        color: ColorsHelper.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      padding: const EdgeInsets.all(
                        AppSize.screenPadding,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  doctor.user.fullName,
                                  style: StyleManager.fontBold20Black.copyWith(
                                    fontFamily: 'Lobster-Regular',
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    BlocProvider.of<FavCubit>(context)
                                        .toggleFav(likedDoctor: doctor);
                                  },
                                  icon: BlocBuilder<FavCubit, FavStates>(
                                    builder: (context, state) {
                                      return const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 22,
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                            Text(
                              doctor.section!.sectionName,
                              style: StyleManager.fontMedium14.copyWith(
                                fontSize: 14,
                                color: ColorsHelper.lighGrey,
                              ),
                            ),
                            const Divider(height: AppSize.size20),
                            Text(
                              "About me",
                              style: StyleManager.fontBold20Black.copyWith(
                                fontFamily: 'Lobster-Regular',
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.size15,
                            ),
                            Text(
                              doctor.user.description != null
                                  ? doctor.user.description!
                                  : "No description",
                              style: StyleManager.fontMedium14.copyWith(
                                fontSize: 14,
                                color: ColorsHelper.lighGrey,
                              ),
                            ),
                            const Divider(height: AppSize.size20),
                            Text(
                              "Working Days",
                              style: StyleManager.fontBold20Black.copyWith(
                                fontFamily: 'Lobster-Regular',
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.size15,
                            ),
                            const TextWithIcon(
                              text: "Monday - Friday - Thursday",
                              icon: Icons.calendar_month,
                            ),
                            const SizedBox(
                              height: AppSize.size10,
                            ),
                            TextWithIcon(
                              text:
                                  "Session duration : ${doctor.session_durtion}m",
                              icon: Icons.timer,
                            ),
                            const SizedBox(
                              height: AppSize.size10,
                            ),
                            TextWithIcon(
                              text:
                                  "Days in advance : ${doctor.days_in_advance} days",
                              icon: Icons.calendar_month,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSize.screenPadding),
                    child: CustomStateButton(
                      onPressed: () {
                        context.push(
                          AppRouter.kSelectAppointment,
                          extra: doctor,
                        );
                      },
                      currentState: ButtonState.idle,
                      label: "BOOK APPOINTMENT",
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
