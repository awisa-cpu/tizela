import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

import '../../utils/device/app_device_services/app_device_services.dart';

class MediaServiceController extends GetxController {
  static MediaServiceController get instance => Get.find();
  final ImagePicker _pickImage = ImagePicker();
  final FilePicker _pickFile = FilePicker.platform;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? imagexFile =
          await _pickImage.pickImage(source: ImageSource.gallery);
      if (imagexFile != null) {
        final File imageFile = File(imagexFile.path);
        return imageFile;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<File?> pickFile() async {
    try {
      final FilePickerResult? pickedFiles = await _pickFile.pickFiles();
      if (pickedFiles != null) {
        final filePicked = File(pickedFiles.files.single.path!);
        return filePicked;
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<File>?> pickImagesFromGallery() async {
    try {
      final List<XFile> imagexFiles = await _pickImage.pickMultiImage();
      if (imagexFiles.isNotEmpty) {
        final List<File> imageFiles =
            imagexFiles.map((image) => File(image.path)).toList();
        return imageFiles;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> uploadImageTo({
    required String currentUid,
    required File imageFile,
  }) {
    try {
      final String mainPath = "Users/$currentUid";
      final String imageName =
          AppDeviceServices.getImageName(imageFile: imageFile);
      final reference = _storage.ref(mainPath).child(imageName);

      final UploadTask uploadTask = reference.putFile(imageFile);
      return uploadTask.then((value) async {
        if (value.state == TaskState.success) {
          return await reference.getDownloadURL();
        } else {
          return null;
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  //todo : review the upload path

  Future<String?> uploadUsersData({
    required String currentUid,
    required File imageFile,
  }) {
    try {
      final String mainPath = "Photos/$currentUid";
      final String imageName =
          AppDeviceServices.getImageName(imageFile: imageFile);
      final reference = _storage.ref(mainPath).child(imageName);

      final UploadTask uploadTask = reference.putFile(imageFile);
      return uploadTask.then((value) async {
        if (value.state == TaskState.success) {
          return await reference.getDownloadURL();
        } else {
          return null;
        }
      });
    } catch (e) {
      rethrow;
    }
  }
}
