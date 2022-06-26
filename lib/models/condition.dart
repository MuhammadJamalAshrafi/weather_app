class Condition {
  String? text;

  Condition({this.text});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }
}
