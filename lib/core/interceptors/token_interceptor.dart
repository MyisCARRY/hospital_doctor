import 'package:dio/dio.dart';
import 'package:hospital_doctor/core/error/exceptions.dart';
import 'package:hospital_doctor/core/usecase/usecase.dart';
import 'package:hospital_doctor/features/auth/domain/usecases/get_token_usecase.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor({
    required this.getTokenUsecase,
  });

  final GetTokenUsecase getTokenUsecase;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await getTokenUsecase(NoParams());
    token.fold(
          (failure) => throw GetTokenException(),
          (data) => options.headers.putIfAbsent('Authorization', () => 'Bearer ${data?.accessToken}'),
    );

    super.onRequest(options, handler);
  }
}
