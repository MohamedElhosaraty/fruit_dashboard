import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_dashboard/core/widget/custom_button.dart';
import 'package:fruit_dashboard/core/widget/custom_text_form_field.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruit_dashboard/features/add_product/presentation/manger/add_product_cubit.dart';
import 'package:fruit_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruit_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';
import 'package:fruit_dashboard/features/add_product/presentation/views/widgets/is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price, expirationMonth, numberOfCalories, unitAmount;
  bool isFeatured = false;
  File? image;
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: "Product Name",
                keyboardInputType: TextInputType.text,
              ),
              16.verticalSpace,
              CustomTextFormField(
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                  hintText: "Product Price",
                  keyboardInputType: TextInputType.number),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value) {
                  expirationMonth = num.parse(value!);
                },
                hintText: "Expiration Month",
                keyboardInputType: TextInputType.number,
              ),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = num.parse(value!);
                },
                hintText: "Number of Calories",
                keyboardInputType: TextInputType.number,
              ),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value) {
                  unitAmount = num.parse(value!);
                },
                hintText: "Unit Amount",
                keyboardInputType: TextInputType.number,
              ),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: "Product code",
                keyboardInputType: TextInputType.number,
              ),
              16.verticalSpace,
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                maxLines: 5,
                hintText: "Product Description",
                keyboardInputType: TextInputType.text,
              ),
              16.verticalSpace,
              IsOrganicCheckBox(
                  onChanged: (value) {
                isOrganic = value;
              }),
              16.verticalSpace,
              IsFeaturedCheckBox(
                  onChanged: (value) {
                isFeatured = value;
              }),
              16.verticalSpace,
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              24.verticalSpace,
              CustomButton(
                  onPressed: () {
                    if (image != null) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        AddProductInputEntity input = AddProductInputEntity(
                          name: name,
                          reviews: [],
                          code: code,
                          description: description,
                          price: price,
                          isFeatured: isFeatured,
                          image: image!,
                          isOrganic: isOrganic,
                          expirationsMonths: expirationMonth.toInt(),
                          numberOfCalories: numberOfCalories.toInt(),
                          unitAmount: unitAmount.toInt(),
                        );
                        context.read<AddProductCubit>().addProduct(input);
                      }
                    } else {
                      autovalidateMode =
                          autovalidateMode = AutovalidateMode.always;
                      showError(context);
                    }
                  },
                  text: "Add Product"),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please select an image "),
      ),
    );
  }
}
