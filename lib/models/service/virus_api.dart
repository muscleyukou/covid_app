import 'package:chopper/chopper.dart';
part 'virus_api.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static const BASE_URL = "http://newsapi.org/v2";
  static const API_KEY = '765be0211378448c9a65f423ed0596f3';

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: BASE_URL,
      services: [
        _$ApiService()
      ],
      converter: JsonConverter(),
    );
    return _$ApiService(client);
  }

  @Get(path: "/top-headlines")
  Future<Response> getHeadLines({@Query("country") String country = 'jp',
    @Query('pageSize') int pageSize = 10,
    @Query('apiKey') String apiKey = ApiService.API_KEY
  });
}