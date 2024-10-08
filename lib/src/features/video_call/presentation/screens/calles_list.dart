import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/widgets/flexible_appbar.dart';
import 'package:patient_app/core/widgets/toast_bar.dart';
import 'package:patient_app/src/features/video_call/presentation/cubits/apis_cubit/schedule_list_states.dart';
import '../../../../../core/domain/services/locator.dart';
import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widgets/clip_path_container.dart';
import '../cubits/apis_cubit/schedule_list_cubit.dart';
import '../widget/doctor_reservation_cell.dart';

class CallesList extends StatelessWidget {
  const CallesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ScheduleListCubit(getIt())..getScheduleList(),
      child: BlocConsumer<ScheduleListCubit, ScheduleListStates>(
        listener: (context, state) {
          if(state is Success_ReserveSchedule_State){
            ToastBar.onSuccess(context, message: "Reserved Successfully", title: "Reservation");
          }
         /* if(state is Error_ReserveSchedule_State) {
            ToastBar.onNetworkFailure(context, networkException: Error_ReserveSchedule_State!.error);
          }*/
          if(state is Success_Delete_ReserveSchedule_State)
            ToastBar.onSuccess(context, message: "${Success_Delete_ReserveSchedule_State.message}", title: "Reservation");
        },
        builder: (context, state) {
          ScheduleListCubit cubit=ScheduleListCubit.get(context);
          return Scaffold(
            appBar: appBarS(title: "Online Consultation"),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPathContainer(),
                Padding(
                  padding: EdgeInsets.only(left: 20.w,top: 10.h),
                  child: Text("Online Doctors",
                    style: StyleManager.fontBold20Black.copyWith(
                      color: Colors.grey
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (ctx,index)=>doctorReservationCell(context: ctx,listCell:cubit.Schedules[index]
                      ),
                      separatorBuilder: (ctx,index)=>SizedBox(),
                      itemCount: cubit.Schedules.length),
                )

              ],
            )
          );
        },
      ),
    );
  }
}
//IconButton(
//               onPressed: () {
//                 PusherCubit cubit = PusherCubit.get(context);
//                 cubit.listen2Channel(context: context);
//               },
//               icon: const Icon(Icons.call),
//             ),
