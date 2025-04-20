import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permissions_app/core/enums/data_source_enum.dart';
import 'package:photo_manager/photo_manager.dart';


class DataSourceController extends ChangeNotifier {
  DataSourceEnum? _selectedSource;

  DataSourceEnum? get selectedSource => _selectedSource;
List<AssetEntity> _images = [];
List<AssetEntity> get images => _images;
  void selectSource(DataSourceEnum source) {
    _selectedSource = source;
    notifyListeners();
  }

  bool isSelected(DataSourceEnum source) => _selectedSource == source;
Future<bool> requestGalleryPermission() async {
  final status = await Permission.photos.request();
  if (status.isGranted || status == PermissionStatus.limited) {
    return true;
  }
  return false;
}


Future<void> loadAllImages() async {
  _images.clear();

  final albums = await PhotoManager.getAssetPathList(
    onlyAll: true,
    type: RequestType.image,
  );

  if (albums.isNotEmpty) {
    final album = albums.first;
    final count = await album.assetCountAsync;

    _images = await album.getAssetListPaged(
      page: 0,
      size: count,
    );
  }

  notifyListeners();
}
}
