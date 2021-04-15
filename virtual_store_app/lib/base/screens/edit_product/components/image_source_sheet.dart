import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {


  ImageSourceSheet({this.onImageSelected});
  final Function(File) onImageSelected;

  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid)
      return BottomSheet(
          onClosing: () {},
          builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: ()async{
                      final PickedFile file = await picker.getImage(source: ImageSource.camera);
                      onImageSelected(File(file.path));

                    },
                    child: Text('Câmera'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final PickedFile file = await picker.getImage(source: ImageSource.gallery);
                      onImageSelected(File(file.path));

                    },
                    child: Text('Galeria'),
                  )
                ],
              ));
    else
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para o item'),
        message: const Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
          onPressed:Navigator.of(context).pop,
        child: const Text('Cancelar')
          ),
        actions: [
          CupertinoActionSheetAction(
            isDefaultAction: true,
              onPressed: () {}, child: const Text('Câmera')),
          CupertinoActionSheetAction(
              onPressed: () {}, child: const Text('Galeria'))
        ],
      );
  }
}
