import "package:firebase_remote_config/firebase_remote_config.dart";
import "export.dart";
import "../models/export.dart";

class UnsplashService {
  final RemoteConfigService remoteConfigService = RemoteConfigService(remoteConfig: FirebaseRemoteConfig.instance);

  final String url = "api.unsplash.com";

  late List<String> keysList;

  List<ImageModel> images = [];

  UnsplashService() {
      _getKeys();
    }

  Future<void> _getKeys() async {
      keysList = await remoteConfigService.getKeys();
  }

  Future getPhotos(String searchTerm) async {
    await _getKeys();
    final NetworkService networkService = NetworkService(
      url: url,
      endpoint: "/search/photos",
      parameters: {
          'query': searchTerm,
      },
      headers: {
        'client_id': keysList[0],
      },
    );
    final photoList = await networkService.getData();
    if (photoList.runTimeType == int){
        return "error";
    } else {
      photoList["results"].forEach((element) {
          if element["urls"]["raw"] != null {
              final ImageModel imageModel = ImageModel(imageUrl: element["urls"]["raw"] as String);
              images.add(imageModel);
            }
        });
      return images;
    }
  }
}
