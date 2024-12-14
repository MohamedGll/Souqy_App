import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exceptions/failures.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_source/remote/category_remote_ds.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/category_model.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repository/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  CategoryRemoteDs categoryRemoteDs;
  CategoryRepoImpl(this.categoryRemoteDs);
  @override
  Future<Either<RemoteFailures, CategoryModel>> getCategory() async {
    try {
      var data = await categoryRemoteDs.getCategory();
      return Right(data);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
