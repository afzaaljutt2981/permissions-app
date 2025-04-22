import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permissions_app/features/auth/presentation/provider/data_source_provider.dart';
import 'package:permissions_app/core/util/app_text.dart';

class MediaAccessGridWidget extends StatelessWidget {
  const MediaAccessGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final images = Provider.of<DataSourceController>(context).images;

    if (images.isEmpty) {
      return  SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: AppText("No images available", 15, FontWeight.normal),
        ),
      );
    }

    return SliverPadding(
      padding: EdgeInsets.all(4.sp),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 6.sp,
          crossAxisSpacing: 6.sp,
        ),
        delegate: SliverChildBuilderDelegate(
          (ctx, index) {
            final asset = images[index];
            return FutureBuilder<Uint8List?>(
              future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
              builder: (c, snap) {
                if (snap.connectionState == ConnectionState.done &&
                    snap.hasData) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5.sp),
                    child: Image.memory(
                      snap.data!,
                      fit: BoxFit.cover,
                    ),
                  );
                }
                return Container(color: Colors.grey.shade300);
              },
            );
          },
          childCount: images.length,
        ),
      ),
    );
  }
}
