import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tizela/data/repositories/user_repo/app_user_repository.dart';
import 'package:tizela/data/services/alert_services.dart';
import 'package:tizela/data/services/local_storage_service.dart';
import 'package:tizela/setup/app_customer_menu.dart';
import 'package:tizela/setup/app_host_menu.dart';
import 'package:tizela/setup/app_navigator.dart';

///Responsibility: for all things authentication with the external backend servers
class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AppUserRepository userRepo = AppUserRepository.instance;

  User? get currentUser => _auth.currentUser;
  final localStorage = GetStorage();

  @override
  void onReady() async {
    FlutterNativeSplash.remove();
    await userScreenDirector();
  }

  Future<void> userScreenDirector() async {
    try {
      if (currentUser != null) {
        //init a local storage for the user
        await LocalStorageService.instance().initUserRecord(
          userBucket: currentUser!.uid,
        );

        String? userRole = _fetchUserRoleLocally(uidKey: currentUser!.uid);

        if (userRole != null) {
          _checkUserRoleAndNavigate(
            role: userRole,
          );
        } else if (userRole == null) {
          final appUser =
              await userRepo.fetchUserDetails(uid: currentUser!.uid);

          _saveUserRoleLocally(
            uidKey: appUser.uid,
            role: appUser.userType.name,
          );
          _checkUserRoleAndNavigate(
            role: appUser.userType.name,
          );
        }
      } else {
        //check if this is the first time of the user
        await localStorage.writeIfNull("userFirstTime", true);
        final bool isUserFirstTime = localStorage.read("userFirstTime");

        isUserFirstTime != true
            ? AppNagivator.pushNamedRoute(
                userSAcountTypeRoute,
              )
            : AppNagivator.pushNamedAndRemoveAll(
                onboardingRoute,
              );
        return;
      }
    } catch (e) {
      AlertServices.warningSnackBar(
        title: "Oh snap",
        message: "Something went wrong please restart app",
      );
    }
  }

/*
  Future<void> _verifyEmailCheckBeforeNavigating() async {
    if (currentUser!.emailVerified) {
      String? userRole = _fetchUserRoleLocally(uidKey: currentUser!.uid);

      if (userRole != null) {
        _checkUserRoleAndNavigate(
          role: userRole,
        );
      } else if (userRole == null) {
        final appUser = await userRepo.fetchUserDetails(uid: currentUser!.uid);

        _saveUserRoleLocally(
          uidKey: appUser.uid,
          role: appUser.userType.name,
        );
        _checkUserRoleAndNavigate(
          role: appUser.userType.name,
        );
      }
    } else {
      Get.to(() => const ConfirmationEmailView());
    }
  }
  */

  void _checkUserRoleAndNavigate({required String role}) {
    if (role == 'customer') {
      Get.offAll(() => const AppCustomerMenu());
    } else if (role == 'host') {
      Get.offAll(() => const AppHostMenu());
    }
  }

  String? _fetchUserRoleLocally({required String uidKey}) {
    return LocalStorageService.instance().readDataLocally<String>(key: uidKey);
  }

  void _saveUserRoleLocally({
    required String uidKey,
    required String role,
  }) async {
    await LocalStorageService.instance()
        .saveDataLocally<String>(key: uidKey, value: role);
  }

  void _deleteUserRole({required String uidKey}) async {
    await LocalStorageService.instance().eraseDataFromLocalStorage(key: uidKey);
  }

  ///create a user
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  ///login user
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //init a local storage for the user
      await LocalStorageService.instance().initUserRecord(
        userBucket: currentUser!.uid,
      );

      //fetch role from db and save locally
      if (currentUser != null) {
        final user = await userRepo.fetchUserDetails(uid: currentUser!.uid);
        _saveUserRoleLocally(uidKey: user.uid, role: user.userType.name);
      }
    } catch (e) {
      rethrow;
    }
  }

  ///logout user
  Future<void> signOutUser() async {
    try {
      if (currentUser != null) {
        _deleteUserRole(uidKey: currentUser!.uid);
        _auth.signOut();
      }
    } catch (e) {
      rethrow;
    }
  }

  ///verify user email address after sign up
  Future<void> sendVerificationEmail() async {
    try {
      currentUser?.sendEmailVerification();
    } catch (e) {
      rethrow;
    }
  }

  ///send password set email to user's email address when password is forgotten but not signed in
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUserAccount() async {
    try {
      if (currentUser != null) {
        currentUser?.delete();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUserPasswordWithEmail({
    required String email,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      if (currentUser != null) {
        final AuthCredential authCredental = EmailAuthProvider.credential(
          email: email,
          password: currentPassword,
        );

        // Re-authenticate
        await currentUser!.reauthenticateWithCredential(authCredental);

        // Update password
        await currentUser!.updatePassword(newPassword);
      }
    } catch (e) {
      rethrow;
    }
  }
}
