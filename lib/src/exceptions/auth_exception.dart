class AuthException implements Exception {
  // Mapeamento dos erros mais comuns relacionados ao processo de login e cadastro
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'E-mail já cadastrado!',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida.',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Tentativas expiradas, tente mais tarde.',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado',
    'INVALID_PASSWORD': 'Senha inválida',
    'USER_DISABLED': 'Usuário desabilitado.',
  };

  final String key;

  AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? 'Ocorreu um erro no processo de autenticação';
  }
}
