import 'package:flutter/material.dart';

class ImageSourceSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: (){},
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: (){},
                child: Text('Câmera'),
            ),
            TextButton(
              onPressed: (){},
              child: Text('Galeria'),
            )

          ],
        )
    );
  }
}
