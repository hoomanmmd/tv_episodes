import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin CancelableNetwork<T, S> on Bloc<T, S>{
  final CancelToken cancelToken = CancelToken();

  @override
  Future<void> close() async{
    await super.close();
    cancelToken.cancel();
  }

}