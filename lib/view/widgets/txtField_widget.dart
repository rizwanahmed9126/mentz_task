import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/utils/constant.dart';


class TxtField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController cnt;
  final FocusNode focusNode;

  const TxtField({Key? key,required this.onChanged,required this.cnt,required this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        focusNode: focusNode,
        textAlign: TextAlign.left,
        controller: cnt,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        cursorColor: baseColor,
        cursorHeight: 20,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 12.0.w),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0.r),
              borderSide: const BorderSide(
                color: baseColor,
                width: 1.4,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0.r),
              borderSide: const BorderSide(
                color: smokeColor,
                width: 1.4,
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0.r),
                ),
                borderSide: const BorderSide(color: smokeColor)),
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
                color: const Color(0xffb5bcc6),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
            hintText: "Start Location",
            suffixIcon: const Icon(Icons.location_searching_rounded,color:smokeColor,)
        ),
      ),
    );
  }
}
