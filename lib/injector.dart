import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app/config/api.dart';
import 'injector.config.dart';

const _baseUrl = 'baseUrl';
const _apiKey = 'apiKey';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependiences() async => $initGetIt(getIt);

@module
abstract class RegisterModule {
  String get _dioBaseUrl => getIt.get<String>(instanceName: _baseUrl);
  String get _dioApiKey => getIt.get<String>(instanceName: _apiKey);

  @Named(_baseUrl)
  String get baseUrl => Api.baseUrl;

  @Named(_apiKey)
  String get apiKey => Api.apiKey;

  @lazySingleton
  Dio dio() => Dio(
        BaseOptions(
          baseUrl: _dioBaseUrl,
          queryParameters: {
            'api_key': _dioApiKey,
          },
        ),
      );
}
