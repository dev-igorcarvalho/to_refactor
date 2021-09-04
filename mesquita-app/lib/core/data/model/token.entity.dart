part 'token.entity.dg.dart';

//UST: 15/08 - TokenEntity - id:7 - 0,5pts - Criação
class TokenEntity {
  TokenEntity(this.token, this.login);

  String token;
  String login;

  factory TokenEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$TokenEntityFromJson(json);

  Map<String, dynamic> toJsonMap() => _$TokenEntityToJson(this);
}
