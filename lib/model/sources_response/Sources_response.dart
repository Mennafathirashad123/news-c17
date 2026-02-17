import 'Source.dart';

class SourcesResponse {
  SourcesResponse({
      this.status, 
      this.sources,
      this.code,
      this.message});

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
  }
  String? status;
  List<Source>? sources;
  String? code;
  String? message;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    map['code']=code;
    map['message']=message;
    return map;
  }

}