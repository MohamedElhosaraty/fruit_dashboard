import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_dashboard/core/utils/app_text_style.dart';

import 'custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturedCheckBox> createState() =>
      _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Is Featured Item ? ",
                  style:
                  TextStyles.semiBold13.copyWith(color: const Color(0xff949D9E)),
                ),
              ],
            ),
          ),
        ),
        16.horizontalSpace,
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChanged: (value) {
              isTermsAccepted = value;
              widget.onChanged(value);
              setState(() {});
              },
        ),
      ],
    );
  }
}
