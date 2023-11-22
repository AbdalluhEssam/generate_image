class ImagesModel {
  String? revisedPrompt;
  String? url;

  ImagesModel({this.revisedPrompt, this.url});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    revisedPrompt = json['revised_prompt'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['revised_prompt'] = revisedPrompt;
    data['url'] = url;
    return data;
  }
}