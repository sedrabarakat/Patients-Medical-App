
import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_model.g.dart';

@JsonSerializable()
class EventModel{
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "channel")
  String channel;
  @JsonKey(name: "token")
  String token;

  EventModel(this.id,this.name,this.channel,this.token);

  factory EventModel.fromJson(Map<String,dynamic>json)=>_$EventModelFromJson(json);

  Map<String,dynamic> ToJson()=>_$EventModelToJson(this);



//{id: 1, name: Ahmad Sami, channel: testing 3, token: test}
}