import 'package:shard/enums/game_status_enum.dart';

class BoardGame {
  BoardGame({
    required this.id,
    required this.name,
    required this.status
  });

  final int id;
  final String name;
  final GameStatus status;
}
