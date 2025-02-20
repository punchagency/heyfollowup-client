// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import '../../screens/create_follow_up/view_model/create_follow_up_vm.dart' as _i12;
import '../../screens/custom_camera/view_model/custom_camera_vm.dart' as _i11;
import '../../screens/follow_up_detail/view_model/follow_up_detail_vm.dart' as _i10;
import '../../screens/follow_ups_screen/view_model/follow_ups_vm.dart' as _i13;
import '../../screens/forgot_password/view_model/forgot_password_vm.dart' as _i7;
import '../../screens/home_container_screen/view_model/home_container_vm.dart' as _i8;
import '../../screens/otp_code/view_model/otp_code_vm.dart' as _i6;
import '../../screens/profile_screen/view_model/profile_screen_vm.dart' as _i9;
import '../animation/animation_service.dart' as _i3;
import '../../screens/splash/view_model/splash_screen_vm.dart' as _i4;
import '../../screens/get_started/view_model/get_started_vm.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AnimationService>(() => _i3.AnimationServiceImpl());
    gh.lazySingleton<_i4.SplashScreenVM>(() => _i4.SplashScreenVM());
    gh.lazySingleton<_i5.GetStartedVm>(() => _i5.GetStartedVm());
    gh.lazySingleton<_i6.OtpCodeVm>(() => _i6.OtpCodeVm());
    gh.lazySingleton<_i7.ForgotPasswordVm>(() => _i7.ForgotPasswordVm());
    gh.lazySingleton<_i8.HomeContainerVm>(() => _i8.HomeContainerVm());
    gh.lazySingleton<_i9.ProfileScreenVM>(() => _i9.ProfileScreenVM());
    gh.lazySingleton<_i10.FollowUpDetailVM>(() => _i10.FollowUpDetailVM());
    gh.lazySingleton<_i11.CustomCameraVm>(() => _i11.CustomCameraVm());
    gh.lazySingleton<_i12.CreateFollowUpVM>(() => _i12.CreateFollowUpVM());
    gh.lazySingleton<_i13.FollowUpsVm>(() => _i13.FollowUpsVm());
    return this;
  }
}
