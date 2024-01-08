import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<String> getImageUrl(String imagePath) async {
  final firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref().child(imagePath);

  final String url = await ref.getDownloadURL();
  return url;
}

String pizzalogoUrl =
    'https://firebasestorage.googleapis.com/v0/b/pizza-order-66.appspot.com/o/assets%2Fimages%2FpizzaOrder66.png?alt=media&token=fb84ce4f-8aac-4c55-885f-fbfea0131933';
