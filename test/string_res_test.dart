import 'dart:convert';

import 'package:string_res/src/builder.dart';
import 'package:test/test.dart';

const example = '''
{
    "first_name": "First Name",
    "log_in": "Log in"
}
''';

void main() {
  test('can generate string consts', () {
    final generator = StringConstGenerator();
    final buffer = StringBuffer();
    generator.makeResource(json.decode(example) as Map<String, Object>, buffer);

    expect(
        buffer.toString(),
        'static const first_name = "First Name";\n'
        'static const log_in = "Log in";\n');
  });
}
