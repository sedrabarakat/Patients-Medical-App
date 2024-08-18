import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/data/models/doctor_model.dart';
import 'package:patient_app/core/domain/services/api_service.dart';
import 'package:patient_app/core/domain/services/locator.dart';
import 'package:patient_app/core/domain/urls/app_url.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/routing/app_router.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<DoctorModel> doctors = [];
  bool loading = true;
  @override
  void initState() {
    getDoctors();
    super.initState();
  }

  Future<void> getDoctors() async {
    ApiServices service = getIt();
    final response = await service.get(AppUrl.getDoctors, queryParams: {
      'per_page': "100",
    });
    for (int i = 0; i < response['data'].length; i++) {
      DoctorModel temp = DoctorModel.fromJson(response['data'][i]);
      doctors.add(temp);
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                  child: CircularProgressIndicator(
                color: ColorsHelper.primary,
              )),
            )
          : Padding(
              padding: const EdgeInsets.all(AppSize.screenPadding),
              child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.push(AppRouter.kSelectAppointment,
                        extra: doctors[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Text(doctors[index].user.fullName),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: doctors.length,
              ),
            ),
    );
  }
}
