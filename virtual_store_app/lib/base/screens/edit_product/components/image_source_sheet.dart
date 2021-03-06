import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  ImageSourceSheet({this.onImageSelected});
  final Function(File) onImageSelected;

  final ImagePicker picker = ImagePicker();

  Future<void>editImage(String path, context) async  {
    final File croppedFile = await ImageCropper.cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Editar Imagem',
          toolbarColor: Theme.of(context).primaryColor,
          toolbarWidgetColor: Colors.white),
    );
    if(croppedFile  != null){
      onImageSelected(croppedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid)
      return SingleChildScrollView(
        child: BottomSheet(
            onClosing: () {},
            builder: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () async {
                    final PickedFile file =
                    await picker.getImage(source: ImageSource.camera);
                    editImage(file.path, context);
                  },
                  child: Text('Câmera'),
                ),
                TextButton(
                  onPressed: () async {
                    final PickedFile file =
                    await picker.getImage(source: ImageSource.gallery);
                    editImage(file.path, context);
                  },
                  child: Text('Galeria'),
                )
              ],
            )),
      );
    else
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o item'),
        message: const Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
            onPressed: Navigator.of(context).pop,
            child: const Text('Cancelar')),
        actions: [
          CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () async {
                final PickedFile file =
                await picker.getImage(source: ImageSource.camera);
                editImage(file.path, context);
              },
              child: const Text('Câmera')),
          CupertinoActionSheetAction(
              onPressed: () async {
                final PickedFile file =
                await picker.getImage(source: ImageSource.camera);
                editImage(file.path, context);
              },
              child: const Text('Galeria'))
        ],
      );
  }
}

