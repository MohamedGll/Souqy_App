import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/category_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/category_repo.dart';

class GetCategoryUsecase {
  CategoryRepo categoryRepo;
  GetCategoryUsecase(this.categoryRepo);

  Future<Either<RemoteFailures, CategoryModel>> call() =>
      categoryRepo.getCategory();
}
