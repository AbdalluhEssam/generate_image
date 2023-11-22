import 'package:generate_image/core/class/crud.dart';
import 'package:generate_image/likeapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  Future getImageData(apiKey, prompt) async {
    var response = await crud.postData(
        AppLink.apiImage,
        {
          'prompt': '$prompt',
          'n': 5,
          'size': '256x256',
        },
        apiKey: apiKey);
    return response;
  }

  Future chatGptData(apiKey, content) async {
    var response = await crud.postData(
        AppLink.apiChat,
        {
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content": "$content"
            }
          ]
        },
        apiKey: "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");
    return response;
  }

  Future getUserData(email, password) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }

  Future coursesSearch(coursesName) async {
    var response = await crud.postData(AppLink.coursesSearch, {
      "name": coursesName.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
