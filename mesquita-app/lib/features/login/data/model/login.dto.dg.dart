part of 'login.dto.dart';

// UST: 01/09 - LoginEntity - id:11 - 2pts - Criação
LoginDto _$LoginEntityFromJson(Map<String, dynamic> json) {
  return LoginDto(
    login: json['login'] as String,
    senha: json['senha'] as String,
  );
}

// UST: 01/09 - LoginEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$LoginEntityToJson(LoginDto instance) =>
    <String, dynamic>{
      'login': instance.login,
      'senha': instance.senha,
    };
