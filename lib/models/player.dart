class Player {
  final String nickname;
  final String socketId;
  final num points;
  final String playerType;

  Player({
    required this.nickname,
    required this.socketId,
    required this.points,
    required this.playerType,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nickname': nickname,
      'socketId': socketId,
      'points': points,
      'playerType': playerType,
    };
  }

  factory Player.fromJson(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickname'],
      socketId: map['socketId'],
      points: map['points'],
      playerType: map['playerType'],
    );
  }

  Player copyWith({
    String? nickname,
    String? socketId,
    double? points,
    String? playerType,
  }) {
    return Player(
      nickname: nickname ?? this.nickname,
      socketId: socketId ?? this.socketId,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
    );
  }
}
