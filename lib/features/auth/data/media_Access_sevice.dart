import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaService {
  Future<List<AssetEntity>> loadImages() async {
    final albums = await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.image,
    );

    if (albums.isNotEmpty) {
      final album = albums.first;
      final count = await album.assetCountAsync;

      return await album.getAssetListPaged(page: 0, size: count);
    }

    return [];
  }

  Future<bool> requestGalleryPermission() async {
    final status = await Permission.photos.request();
    return status.isGranted || status == PermissionStatus.limited;
  }
}
