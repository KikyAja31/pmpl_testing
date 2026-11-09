import 'package:flutter_test/flutter_test.dart';
import 'package:testing/repositories/auth_repository.dart';
import 'package:testing/services/auth_service.dart';

void main() {
  late AuthRepository repository;

  setUp(() {
    repository = AuthRepository(
      FakeAuthService(
        users: const {'budi@mail.com': 'rahasia123'},
        delay: Duration.zero,
      ),
    );
  });

  group('AuthRepository.login', () {
    test('email & password benar -> return User', () async {
      final user = await repository.login('budi@mail.com', 'rahasia123');

      expect(user.name, 'Budi');
      expect(user.email, 'budi@mail.com');
    });

    test('password salah -> throw AuthExpection', () async {
      expect(
        () => repository.login('budi@mail.com', 'salah'),
        throwsA(
          isA<AuthException>().having(
            (e) => e.message,
            'message',
            'Password salah',
          ),
        ),
      );
    });
  });

  test('email tidak terdaftar -> throw AuthExpection', () async {
    expect(
      () => repository.login('unknow@mail.com', 'rahasia123'),
      throwsA(isA<AuthException>()),
    );
  });
}
