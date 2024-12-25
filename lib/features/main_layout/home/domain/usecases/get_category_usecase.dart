import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failures.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/category_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoryUsecase {
  CategoryRepo categoryRepo;
  GetCategoryUsecase(this.categoryRepo);

  Future<Either<RemoteFailures, CategoryModel>> call() =>
      categoryRepo.getCategory();
}
