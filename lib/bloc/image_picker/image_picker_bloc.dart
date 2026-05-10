import 'package:bloc/bloc.dart';
import 'package:bloc_learning/utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';


class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils _imagePickerUtils;

  ImagePickerBloc(this._imagePickerUtils) : super( ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_galleryImagePicker);
  }

  void _cameraCapture(CameraCapture event, Emitter<ImagePickerState> emit) async {
     XFile? file = await _imagePickerUtils.cameraCapture();
    emit(state.copyWith(imageFile: file));
  }

  void _galleryImagePicker(GalleryImagePicker event, Emitter<ImagePickerState> emit) async {
     XFile? file = await _imagePickerUtils.galleryImagePicker();
    emit(state.copyWith(imageFile: file));
  }
}
