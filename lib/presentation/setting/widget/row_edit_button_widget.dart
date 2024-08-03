import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huynd2_assignment/domain/auth/entity/user_entity.dart';
import 'package:huynd2_assignment/manager/color.dart';
import 'package:huynd2_assignment/presentation/setting/edit_username_screen.dart';


class RowEditButtonSectionWidget extends StatelessWidget {
  const RowEditButtonSectionWidget({
    super.key,
    required UserEntity user,
  }) : _user = user;

  final UserEntity _user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'general_information'.tr(),
          style: TextStyle(
              fontSize: 16.sp, fontWeight: FontWeight.w300, color: Colors.grey),
        ),
        GestureDetector(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditUsernameScreen(user: _user),
              ),
            );
          },
          child: Text(
            'edit'.tr(),
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: TAppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
