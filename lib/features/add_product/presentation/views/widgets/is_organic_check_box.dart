import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_dashboard/core/utils/app_text_style.dart';

import 'custom_check_box.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicCheckBox> createState() =>
      _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "is Product Organic ? ",
                  style:
                  TextStyles.semiBold13.copyWith(color: const Color(0xff949D9E)),
                ),
              ],
            ),
          ),
        ),
        16.horizontalSpace,
        CustomCheckBox(
          isChecked: isOrganic,
          onChanged: (value) {
            isOrganic = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
