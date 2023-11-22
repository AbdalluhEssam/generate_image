import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:generate_image/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:generate_image/controller/home/home_controller.dart';
import 'package:generate_image/core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/icon_broken.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text("Generate Image AI"),
      ),
      drawer: Drawer(
        child:Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Abdalluh Essam'),
              accountEmail: Text('abdallhesam100@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: AppColor.primaryColor,
                ),
              ),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text(
                'Chat Gpt',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                // Handle item 1 tap
                Get.toNamed(AppRoute.chatGptPage); // Close the drawer
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.audio_file_outlined),
              title: const Text(
                'Audio Generate',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                // Handle item 2 tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            const Spacer(),
            const Text( 'Abdullah Essam | @2023',)
            // Add more ListTiles for additional drawer items
          ],
        ),
      ),
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  children: [
                    Expanded(
                      child: HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: controller.images.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15,
                                      childAspectRatio: 1),
                              itemBuilder: (BuildContext context, int index) =>
                                  PhotoCard(
                                      imageUrl:
                                          "${controller.images[index].url}"),
                            ),
                          )),
                    ),
                    Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Form(
                          key: controller.formKey,
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextFormField(
                                controller: controller.prompt,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'not message';
                                  }
                                  return null;
                                },
                                style: const TextStyle(color: AppColor.white),
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    hintText: 'type your message here...',
                                    hintStyle: TextStyle(color: AppColor.white),
                                    border: InputBorder.none),
                              )),
                              Container(
                                  height: 50,
                                  color: AppColor.white,
                                  child: MaterialButton(
                                    minWidth: 1,
                                    onPressed: () {
                                      controller.getData();
                                    },
                                    child: const Icon(
                                      IconBroken.Send,
                                      color: AppColor.primaryColor,
                                    ),
                                  ))
                            ],
                          ),
                        ))
                  ],
                ),
              )),
    );
  }
}

//26912
class PhotoCard extends StatelessWidget {
  final String imageUrl;

  const PhotoCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
