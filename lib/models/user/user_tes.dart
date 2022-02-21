import 'package:equatable/equatable.dart';

class UserTes extends Equatable {
  const UserTes(this.id);

  final String id;

  @override
  List<Object> get props => [id];

  static const empty = UserTes('-');
}
