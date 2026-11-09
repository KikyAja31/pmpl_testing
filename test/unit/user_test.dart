import 'package:flutter_test/flutter_test.dart';
import 'package:testing/models/user.dart';

void main() {
  group('User Model', () {
    test('finalJson returns Valid User', () {
      final json = {'id': '1', 'name': 'Budi', 'email': 'budi@mail.com'};

      final user = User.fromJson(json);

      expect(user.id, '1');
      expect(user.name, 'Budi');
      expect(user.email, 'budi@mail.com');
    });

    test('toJson returns correct map', () {
      const user = User(id: '1', name: 'Budi', email: 'budi@mail.com');

      expect(user.toJson(), {
        'id': '1',
        'name': 'Budi',
        'email': 'budi@mail.com',
      });
    });

    test('fromJson -> toJson bersifat simetris (round-trip)', () {
      final json = {'id': '2', 'name': 'Ani', 'email': 'ani@mail.com'};

      final user = User.fromJson(json);

      expect(user.toJson(), json);
    });

    test('equality: dua User dengan field sama dianggap sama', () {
      const a = User(id: '1', name: 'Budi', email: 'budi@mail.com');
      const b = User(id: '1', name: 'Budi', email: 'budi@mail.com');

      expect(a, equals(b));
      expect(a.hashCode, b.hashCode);
    });

    test('copyWith mengubah field yang dipilih saja', () {
      const user = User(id: '1', name: 'Budi', email: 'budi@mail.com');

      final renamed = user.copyWith(name: 'Budi Santoso');
      expect(renamed.name, 'Budi Santoso');
      expect(renamed.id, '1');
      expect(renamed.email, 'budi@mail.com');
    });
  });
}
