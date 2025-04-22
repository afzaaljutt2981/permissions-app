import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permissions_app/core/enums/data_source_enum.dart';
import 'package:permissions_app/core/util/app_routes.dart';
import 'package:permissions_app/core/util/app_strings.dart';
import 'package:permissions_app/core/util/utils.dart';
import 'package:permissions_app/features/auth/data/apple_auth_service.dart';
import 'package:permissions_app/features/auth/data/fairebase_auth_service.dart';
import 'package:permissions_app/features/auth/data/google_auth_service.dart';
import 'package:permissions_app/features/auth/data/media_Access_sevice.dart';
import 'package:permissions_app/features/auth/model/google_user_model.dart';
import 'package:permissions_app/features/auth/presentation/view/summery_screen.dart';
import 'package:photo_manager/photo_manager.dart';

class DataSourceController extends ChangeNotifier {
  DataSourceEnum? _selectedSource;
  GoogleUserModel? _user;
  List<AssetEntity> _images = [];

  final FacebookAuthService _facebookAuthService = FacebookAuthService();
  final GoogleAuthService _googleAuthService = GoogleAuthService();
  final AppleAuthService _appleAuthService = AppleAuthService();
  final MediaService _mediaService = MediaService();

  DataSourceEnum? get selectedSource => _selectedSource;
  GoogleUserModel? get user => _user;
  List<AssetEntity> get images => _images;

  bool isSelected(DataSourceEnum source) => _selectedSource == source;

  void selectSource(DataSourceEnum source) {
    _selectedSource = source;
    notifyListeners();
  }

  void setUser(GoogleUserModel user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }

  Future<void> loginWithFacebook(BuildContext context) async {
    final result = await _facebookAuthService.signInWithFacebook();
    if (result != null) {
      _user = result;
      AppRoutes.push(
          context, PageTransitionType.rightToLeft, const UserSummaryScreen());
      notifyListeners();
    } else {
      Utils.showToast(LocaleKeys.failedFbLogin);
    }
  }

  Future<void> loginWithGoogle(BuildContext context) async {
    final result = await _googleAuthService.signInWithGoogle();
    if (result != null) {
      _user = result;
      AppRoutes.push(
          context, PageTransitionType.rightToLeft, const UserSummaryScreen());
      notifyListeners();
    } else {
      Utils.showToast(LocaleKeys.failedGoogleLogin);
    }
  }

  Future<void> loginWithApple(BuildContext context) async {
    final result = await _appleAuthService.signInWithApple();
    if (result != null) {
      _user = result;
      AppRoutes.push(
          context, PageTransitionType.rightToLeft, const UserSummaryScreen());
      notifyListeners();
    } else {
      Utils.showToast(LocaleKeys.failedAppleLogin);
    }
  }

  Future<bool> requestGalleryPermission() async {
    return await _mediaService.requestGalleryPermission();
  }

  Future<void> loadAllImages() async {
    _images = await _mediaService.loadImages();
    notifyListeners();
  }
}
