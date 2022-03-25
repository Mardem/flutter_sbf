import 'login_types.dart';

class SocialInfo {
  String defaultMessage = 'Não foi possível realizar o login';

  String _name = '...';
  String _email = '...';
  String _message = 'Não foi possível realizar o login';
  bool _success = false;
  late LoginType _loginType;

  SocialInfo({LoginType? loginType}) {
    _loginType = loginType ?? LoginType.email;
  }

  get name => _name;

  set name(value) => _name = value;

  get email => _email;

  set email(value) => _email = value;

  bool get success => _success;

  set success(value) => _success = value;

  get message => _message;

  set message(value) => _message = value ?? defaultMessage;

  get loginType => translateLoginType(_loginType);

  set loginType(value) => _loginType = value;

  String translateErrors(String errorKey) {
    switch (errorKey) {
      case 'account-exists-with-different-credential':
        defaultMessage =
            'Esta conta existe com um provedor de login diferente!';
        break;
      case 'invalid-credential':
        defaultMessage = 'Ocorreu um erro desconhecido!';
        break;
      case 'operation-not-allowed':
        defaultMessage = 'Essa operação não é permitida!';
        break;
      case 'user-disabled':
        defaultMessage = 'O usuário que você tentou acessar está desabilitado!';
        break;
      case 'user-not-found':
        defaultMessage =
            'O usuário que você tentou acessar não foi encontrado!';
        break;
    }
    return defaultMessage;
  }

  String translateLoginType(LoginType loginType) =>
      LoginType.values[loginType.index]
          .toString()
          .split('.')
          .last
          .toUpperCase();

  @override
  String toString() {
    return 'SocialInfo{_name: $_name, _email: $_email, _message: $_message, _success: $_success, _loginType: $loginType}';
  }
}
