import 'package:flutter/material.dart';
import 'package:permissions_app/core/util/app_strings.dart';
import 'package:permissions_app/features/auth/presentation/provider/data_source_provider.dart';
import 'package:provider/provider.dart';
import 'package:permissions_app/features/widgets/user_header_card.dart';
import 'package:permissions_app/core/util/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoogleFaceebokUserSummaryWidget extends StatelessWidget {
  const GoogleFaceebokUserSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DataSourceController>(context).user;

    if (user == null) {
      return SliverToBoxAdapter(
        child: Center(
            child: AppText(LocaleKeys.noUserData, 15, FontWeight.normal)),
      );
    }
    return SliverToBoxAdapter(
      child: UserHeaderCard(
        column: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (user.photoUrl != null)
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.photoUrl!),
                ),
              ),
            SizedBox(height: 10.h),
            _textForm(LocaleKeys.nameLabel, user.name ?? ""),
            _textForm(LocaleKeys.emailLabel, user.email ?? ""),
          ],
        ),
      ),
    );
  }

  Widget _textForm(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(title, 14, FontWeight.w400),
          AppText(value, 16, FontWeight.w500),
        ],
      ),
    );
  }
}
