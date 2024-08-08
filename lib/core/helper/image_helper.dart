import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageHelper {
  static final ImagePicker _imagePicker = ImagePicker();
  static Future<File?> pickImage(ImageSource source) async {
    XFile? pickedImage;
    switch (source) {
      case ImageSource.camera:
        pickedImage = await _imagePicker.pickImage(source: ImageSource.camera);
        break;
      case ImageSource.gallery:
        pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
        break;
      default:
        pickedImage = null;
    }
    return pickedImage != null ? File(pickedImage.path) : null;
  }

  static Future<List<File>> pickMultiImage() async {
    List<XFile> pickedImages = [];
    List<File> returnedImages = [];
    pickedImages = await _imagePicker.pickMultiImage();
    for (int i = 0; i < pickedImages.length; i++) {
      returnedImages.add(File(pickedImages[i].path));
    }
    return returnedImages;
  }
}
