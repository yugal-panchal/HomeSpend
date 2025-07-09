class ResponseModel {
  bool success;
  String message;
  Map<String, dynamic>? data;

  ResponseModel(this.success, this.message, {this.data});

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(map['success'], map['message'], data: map["data"]);
  }

  Map<String, dynamic> toMap() {
    return {'success': success, 'message': message, 'data': data};
  }
}
