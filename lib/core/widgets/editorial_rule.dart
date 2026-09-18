import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class EditorialRule extends StatelessWidget {
  const EditorialRule({super.key, this.width = 56});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 3,
      color: AppColors.blue,
    );
  }
}
