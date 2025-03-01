import 'dart:io';

import 'package:get/get.dart';
import '../../../../../data/local_database.dart';
import '../../../../../data/services/alert_services.dart';
import '../../../../../data/services/media_service.dart';
import '../../../../../utils/device/app_device_services/app_device_services.dart';
import '../../../../menu/host_menu/listings/model/app_file_model.dart';
import '../../../../menu/host_menu/listings/model/id_type_model.dart';

class IdVerificationController extends GetxController {
  static IdVerificationController get instance => Get.find();
  final MediaServiceController mediaService = Get.put(MediaServiceController());

  ///
  RxList<IdTypeModel> availableIdTypes = LocalDatabase.availableIdTypes;
  Rx<IdTypeModel> selectedIdType = IdTypeModel.empty().obs;
  Rx<AppFileModel> idFrontPage = AppFileModel.empty().obs;
  Rx<AppFileModel> idBackPage = AppFileModel.empty().obs;

  String getIdName({required IdType idType}) {
    switch (idType) {
      case IdType.interpassport:
        return "International passport";

      case IdType.nationalid:
        return "National ID";

      case IdType.driverlicense:
        return "Driver's license";

      case IdType.nin:
        return "National Identity Number (NIN)";

      case IdType.voterscard:
        return "Voters card";

      default:
        return "id card";
    }
  }

  void updateSelectedIdChanged({required int itemIndex}) {
    //deselect all others
    for (var item in availableIdTypes) {
      item.isActive.value = false;
    }

    //assign the selected
    selectedIdType.value = availableIdTypes[itemIndex];
    selectedIdType.value.isActive.value = true;
  }

  void selectIdCardType({
    required Rx<AppFileModel> id,
  }) async {
    try {
      if (!selectedIdType.value.isActive.value) {
        AlertServices.warningSnackBar(
            title: "Oh snap", message: "Select an Id type first");
        return;
      }

      File? pickedId = await mediaService.pickFile();
      if (pickedId != null) {
        final fileName =
            AppDeviceServices.getImageName(imageFile: pickedId, index: 8);
        final fileSize = await AppDeviceServices.getFileSize(file: pickedId);

        id.value = id.value.copyWith(
          name: fileName,
          file: pickedId,
          size: fileSize,
        );

        if (!selectedIdType.value.idFiles.contains(id.value.file)) {
          selectedIdType.value.idFiles.add(id.value.file);
        }
      }
    } catch (e) {
      AlertServices.errorSnackBar(
        title: "oh snap",
        message: "id could not be selected",
      );
    }
  }

  void onSubmit() {
    try {
      //make some checks for both sides of the card to be selected
      if (idFrontPage.value.file.path.isEmpty ||
          idBackPage.value.file.path.isEmpty) {
        AlertServices.warningSnackBar(
          title: "Oh snap",
          message: "Both sides of the card must be selected",
        );
        return;
      }

      //submit the id for review

      AlertServices.successSnackBar(
        title: "Success",
        message: "id submitted successfully",
      );
    } catch (e) {
      AlertServices.errorSnackBar(
        title: "oh snap",
        message: "id could not be submitted",
      );
    }
  }
}
