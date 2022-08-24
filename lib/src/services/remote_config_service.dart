import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:flutter/services.dart";

class RemoteConfigService{
  final FirebaseRemoteConfig remoteConfig;

  RemoteConfigService({required this.remoteConfig});

  Future<FirebaseRemoteConfig?> _initialise() async {
      try {
          await remoteConfig.setConfigSettings(
            RemoteConfigSettings(
              fetchTimeout: const Duration(seconds: 10),
              minimumFetchInterval: Duration.zero
            ),
          );
          await remoteConfig.fetchAndActivate();
          return remoteConfig;
        } on PlatformException catch (exception){
            print(exception);
          } catch (exception) {
              print("Unable to fetch remote config. Cached or default values will be used");
              print(exception);
            }
            return null;
    }

    Future<List<String>> getKeys() async {
        final remoteConfig = await _initialise();
        final accessKey = remoteConfig!.getString('access_key');
        final secretKey = remoteConfig.getString('secret_key');
        return [accessKey, secretKey];
    }
}
