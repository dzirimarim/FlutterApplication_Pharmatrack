import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetTourneesCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllTour',
      apiUrl: 'http://192.168.43.71:8080/api/tour/all',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
