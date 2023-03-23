import 'package:dartz/dartz.dart';
import 'package:weather_app/core/data/error_response_model.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ErrorsModel, Type>> call(Params params);
}
