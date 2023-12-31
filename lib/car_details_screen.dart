import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cardeal/app_cache.dart';
import 'package:flutter_cardeal/components/components.dart';
import 'package:flutter_cardeal/user_profile_screen.dart';

import 'components/text_field.dart';
import 'cubit/app_cubit.dart';
import 'models/car_model.dart';

class CarDetailsScreen extends StatelessWidget {
  CarDetailsScreen({super.key, required this.model, this.isMe});
  CarModel model;
  bool? isMe;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        String id = model.owner!.split(",").first;
        bool isUser = isMe ?? id == CacheHelper.getData(key: "id");

        return SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              actions: [
                isUser
                    ? const SizedBox()
                    : IconButton(
                        onPressed: () {
                          pushNavigation(
                              context,
                              UserProfileScreen(
                                  id: id, name: model.owner!.split(",").last));
                          AppCubit().get(context).getUserCar(id: id);
                          AppCubit().get(context).getUser(id);
                        },
                        icon: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: const Icon(
                            CupertinoIcons.profile_circled,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Card(
                      color: Colors.black,
                      margin: EdgeInsets.zero,
                      elevation: 6,
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: InteractiveViewer(
                        child: Image.network(
                          "${model.imageUrl}",
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset("assets/images/cardeal.png"),
                          width: double.infinity,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "${model.make}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "${model.model} ${model.year}",
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            color: Colors.grey.shade200,
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 4,
                                  vertical: 15),
                              child: Text(
                                "Price: ${model.price?.split('.').first}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Card(
                              color: Colors.grey.shade200,
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 3.6,
                                    vertical: 15),
                                child: Text(
                                  "Color: ${model.color}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Card(
                              color: Colors.grey.shade200,
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 4,
                                    vertical: 15),
                                child: Text(
                                  "Mileage: ${model.mileage} mile",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Card(
                              color: Colors.grey.shade200,
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 4,
                                    vertical: 15),
                                child: Text(
                                  "Condition: ${model.condition}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Card(
                              color: Colors.grey.shade200,
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 4,
                                    vertical: 15),
                                child: Text(
                                  "Type: ${model.type}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Card(
                              color: Colors.grey.shade200,
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 4,
                                    vertical: 15),
                                child: Text(
                                  "Transmission: ${model.transmission}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Description:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            "${model.description}",
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          !isUser
                              ? ElevatedButton(
                                  onPressed: () {
                                    showDialoge(context);
                                  },
                                  child: Text("Buy"))
                              : SizedBox(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  showDialoge(context) {
    showDialog(
        context: context,
        builder: (context) {
          var priceController = TextEditingController();
          var key = GlobalKey<FormState>();
          return Dialog(
            child: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return Form(
                  key: key,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyTextField().build(context,
                          lable: const Text("Price"),
                          hint: "Suggestted Price",
                          controller: priceController, validator: (value) {
                        if (value!.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      }),
                      ElevatedButton(
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              AppCubit().get(context).requestCar(
                                  carID: model.id, price: priceController.text);
                              popNavigation(context);
                            }
                          },
                          child: const Text("Request car"))
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
