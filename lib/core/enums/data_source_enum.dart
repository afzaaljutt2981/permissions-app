import 'package:permissions_app/core/util/app_images.dart';

enum DataSourceEnum {
  facebook('Facebook', AppImages.facebook),
  gmail('Gmail', AppImages.email),
  appleId('Apple ID', AppImages.apple),
  mediaAccess('Media Access (Photos/Videos)', AppImages.gallary);

  final String label;
  final String iconPath;

  const DataSourceEnum(this.label, this.iconPath);

  @override
  String toString() => label;
}
