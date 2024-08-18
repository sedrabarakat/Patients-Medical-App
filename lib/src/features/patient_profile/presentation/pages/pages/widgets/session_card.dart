import 'package:flutter/material.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/dimension_manager.dart';
import 'package:patient_app/core/utils/style_manager.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({
    super.key,
    required this.isOpen,
    required this.onTap,
    required this.date,
    required this.price,
    required this.time,
  });
  final bool isOpen;
  final void Function()? onTap;
  final String date;
  final String price;
  final List<String> time;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsHelper.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: .2,
              blurRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppSize.size10),
        child: Row(
          children: [
            Text(
              "${time[0]}:",
              style: const TextStyle(
                color: ColorsHelper.primary,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${time[1]}\n',
                    style: const TextStyle(
                      color: ColorsHelper.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: time[2],
                    style: const TextStyle(
                      color: ColorsHelper.lighGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: AppSize.size10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "date : ",
                        style: StyleManager.fontExtraBold14Black
                            .copyWith(color: ColorsHelper.primaryLight),
                      ),
                      TextSpan(
                        text: date,
                        style: StyleManager.fontRegular14Black,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "price: ",
                        style: StyleManager.fontExtraBold14White.copyWith(
                          color: ColorsHelper.primaryLight,
                        ),
                      ),
                      TextSpan(
                        text: price,
                        style: StyleManager.fontRegular14Black
                            .copyWith(color: ColorsHelper.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: isOpen ? ColorsHelper.turquoise : Colors.redAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.size10,
                vertical: 5,
              ),
              child: Text(
                isOpen ? "Opened" : "Closed",
                style: StyleManager.fontRegular14Black.copyWith(
                  color: ColorsHelper.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
