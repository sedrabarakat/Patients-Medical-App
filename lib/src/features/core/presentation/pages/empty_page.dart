import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:patient_app/core/utils/color_manager.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Empty', style: TextStyle(color: ColorsManager.primary, fontWeight: FontWeight.bold),),
    );
  }
}
