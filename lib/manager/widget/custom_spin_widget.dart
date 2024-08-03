import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:huynd2_assignment/manager/color.dart';

class SpinCustomWidget extends StatelessWidget {
  final double sized;
  const SpinCustomWidget({
    super.key,
    required this.sized,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: TAppColor.primaryColor,
        size: sized,
      ),
    );
  }
}
