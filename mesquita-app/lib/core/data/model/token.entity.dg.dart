part of 'token.entity.dart';

// UST: 01/09 - TokenEntity - id:11 - 2pts - Criação
TokenEntity _$TokenEntityFromJson(Map<String, dynamic> json) {
  return TokenEntity(
    json['token'] as String,
    json['login'] as String,
  );
}

// UST: 01/09 - TokenEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$TokenEntityToJson(TokenEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'login': instance.login,
    };
