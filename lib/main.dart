import 'dart:async';
import 'api_service.dart';
import 'user.dart';

void main() async {
  try {
    List<User> users = await fetchUsers();

    // Mostrar usuarios con username mayor a 6 caracteres
    print('Usuarios con username mayor a 6 caracteres:');
    filterUsersByUsernameLength(users);

    // Contar usuarios con email en el dominio biz
    print('Cantidad de usuarios con email en el dominio biz:');
    countUsersWithBizEmail(users);
  } catch (e) {
    print('Error: $e');
  }
}

void filterUsersByUsernameLength(List<User> users) {
  var filteredUsers = users.where((user) => user.username.length > 6).toList();
  filteredUsers.forEach((user) => print(user.username));
}

void countUsersWithBizEmail(List<User> users) {
  var count = users.where((user) => user.email.endsWith('@biz')).length;
  print(count);
}
