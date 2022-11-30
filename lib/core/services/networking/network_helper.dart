import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:know_my_country/core/models/country.dart';
import 'package:know_my_country/core/services/networking/dio_exceptions.dart';
import 'package:know_my_country/core/services/networking/dio_setup.dart';

final networkHelperProvider = Provider((ref) => NetworkHelper(ref));

class NetworkHelper {
  NetworkHelper(ProviderRef ref) : _ref = ref;
  final ProviderRef _ref;

  Dio get _dio => _ref.read(dioProvider);

  Future<List<Country>> getCountries({Map<String, dynamic>? filters}) async {
    //TODO: research and structure api call properly
    try {
      final response = await _dio.get<List<dynamic>>(
        'all',
        queryParameters: filters,
      );

      final data = response.data!.map((e) => Country.fromJson(e)).toList();

      return data;
    } on DioError catch (e) {
      throw DioExceptions.fromDioError(e).toString();
    }
  }
}
