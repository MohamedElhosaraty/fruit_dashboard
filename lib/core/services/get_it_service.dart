import 'package:fruit_dashboard/core/services/firebase_service.dart';
import 'package:fruit_dashboard/core/services/stoarage_service.dart';
import 'package:fruit_dashboard/core/services/supabase_stoarge.dart';
import 'package:get_it/get_it.dart';

import '../repos/images_repo/images_repo.dart';
import '../repos/images_repo/images_repo_impl.dart';
import '../repos/product_repo/products_repo.dart';
import '../repos/product_repo/products_repo_impl.dart';
import 'data_service.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StoarageService>(SupabaseStoarge());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(getIt.get<StoarageService>()));
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt.get<DatabaseService>(),
    ),
  );
}
