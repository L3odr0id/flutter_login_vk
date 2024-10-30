/// VK access token.
class VKAccessToken {
  final String token;
  final String userId;
  final String? secret;
  final DateTime created;
  final String? email;
  final String? phone;

  VKAccessToken.fromMap(Map<String, dynamic> map)
      : token = map['token'] as String,
        userId = map['userId'] as String,
        created = DateTime.fromMillisecondsSinceEpoch(map['created'] as int,
            isUtc: true),
        secret = map['secret'] as String?,
        phone = map['phone'] as String?,
        email = map['email'] as String?;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'userId': userId,
      'created': created.millisecondsSinceEpoch,
      'secret': secret,
      'email': email,
      'phone': phone,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VKAccessToken &&
          token == other.token &&
          userId == other.userId &&
          created == other.created &&
          secret == other.secret &&
          phone == other.phone &&
          email == other.email;

  @override
  int get hashCode =>
      token.hashCode ^
      userId.hashCode ^
      created.hashCode ^
      secret.hashCode ^
      phone.hashCode ^
      email.hashCode;

  @override
  String toString() {
    return 'VKAccessToken(token: $token, userId: $userId, '
        'created: $created, secret: $secret, email: $email, phone: $phone)';
  }
}
