import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruit_dashboard/core/services/get_it_service.dart';
import 'package:fruit_dashboard/features/add_product/presentation/manger/add_product_cubit.dart';
import 'package:fruit_dashboard/features/add_product/presentation/views/widgets/add_product_view_body_bloc_builder.dart';

import '../../../../core/widget/custom_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add-product';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: 'Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
        getIt.get<ImagesRepo>(),
        getIt.get<ProductsRepo>()
        ),
        child: const  AddProductsViewBodyBlocBuilder(),
      ),
    );
  }
}
