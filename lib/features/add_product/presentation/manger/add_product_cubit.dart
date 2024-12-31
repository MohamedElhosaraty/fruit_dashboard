import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    final result = await imagesRepo.uploadImage(addProductInputEntity.image);
    result.fold(
      (l) {
        emit(
          AddProductFailure(errorMessage: l.message),
        );
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var resul = await productsRepo.addProduct(addProductInputEntity);
        resul.fold((l) {
          emit(
            AddProductFailure(errorMessage: l.message),
          );
        }, (r) {
          emit(AddProductSuccess());
        });
      },
    );
  }
}
