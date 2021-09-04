part 'login.dto.dg.dart';

//UST: 15/08 - LoginEntity - id:7 - 0,5pts - Criação
class LoginDto {
  String login;
  String senha;

  LoginDto({this.login, this.senha});

  factory LoginDto.fromJsonMap(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);

  Map<String, dynamic> toJsonMap() => _$LoginEntityToJson(this);
}
