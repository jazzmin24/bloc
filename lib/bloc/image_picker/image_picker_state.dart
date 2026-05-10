part of 'image_picker_bloc.dart';

class ImagePickerState extends Equatable {
  final XFile? imageFile;

  const ImagePickerState({
     this.imageFile,
  });

  ImagePickerState copyWith({XFile? imageFile}) {
    return ImagePickerState(imageFile: imageFile ?? this.imageFile);
  }

  @override
  List<Object?> get props => [imageFile?.path];
}
