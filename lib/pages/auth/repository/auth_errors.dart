String authErrorString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS': return 'Email e/ou senha inválidos';
    case 'Invalid session token': return 'Token inválido';
    case 'INVALID_FULLNAME': return 'Nome inválido';
    case 'INVALID_PHONE': return 'telefone inválido';
    case 'INVALID_CPF': return 'CPF inválido';
    default: return 'Um erro ocorreu!';
  }
}