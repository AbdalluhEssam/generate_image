import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:generate_image/core/class/handlingdataview.dart';
import '../../../controller/home/ChatGpt_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/icon_broken.dart';
import '../../../data/model/massage_model.dart';

class ChatGptPage extends StatelessWidget {
  const ChatGptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChatGptControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text("chat"),
      ),
      body: GetBuilder<ChatGptControllerImp>(
          builder: (controller) => Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  children: [
                    controller.message.isNotEmpty
                        ? Expanded(
                            child: HandlingDataView(
                                statusRequest: controller.statusRequest,
                                widget: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        if (controller.message[index].role ==
                                            "messageMe") {
                                          return buildMyMessage(
                                            controller.message[index],
                                            () {
                                              controller.copyToClipboard(
                                                  controller
                                                      .message[index].content!);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Text copied to clipboard'),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                        return buildMessage(
                                          controller.message[index],
                                          () {
                                            controller.copyToClipboard(
                                                controller
                                                    .message[index].content!);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Text copied to clipboard'),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            height: 8,
                                          ),
                                      itemCount: controller.message.length),
                                )),
                          )
                        : Expanded(
                            child: Center(
                                child: Text(
                              "New Chat With AI",
                              style: Theme.of(context).textTheme.bodyLarge,
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
                                controller: controller.content,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'not message';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                    color: AppColor.primaryColor),
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    hintText: 'type your message here...',
                                    hintStyle:
                                        TextStyle(color: AppColor.primaryColor),
                                    border: InputBorder.none),
                              )),
                              Container(
                                  height: 50,
                                  color: AppColor.primaryColor,
                                  child: MaterialButton(
                                    minWidth: 1,
                                    onPressed: () {
                                      controller.messageMe
                                          .add(controller.content.text);
                                      controller.update();
                                      controller.getData();
                                    },
                                    child: const Icon(
                                      IconBroken.Send,
                                      color: AppColor.white,
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
Widget buildMessage(MassageModel model, void Function()? onTap) => Align(
      alignment: AlignmentDirectional.centerStart,
      child: GestureDetector(
          onLongPress: onTap,
          child: Container(
            constraints: BoxConstraints(maxWidth: Get.width * 0.8),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(10),
                  bottomStart: Radius.circular(10),
                  topEnd: Radius.circular(10),
                )),
            child: Text(model.content!.toString()),
          )),
    );

Widget buildMyMessage(MassageModel model, void Function()? onTap) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: GestureDetector(
      onLongPress: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: Get.width * 0.8),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: AppColor.primaryColor.withOpacity(0.4),
            borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              bottomStart: Radius.circular(10),
              topStart: Radius.circular(10),
            )),
        child: Text(model.content.toString()),
      ),
    ));
