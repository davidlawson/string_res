import 'dart:convert';

import 'package:string_res/src/builder.dart';
import 'package:test/test.dart';

const example = '''
{
    "first_name": "First Name",
    "log_in": "Log in"
}
''';

const longExample = '''
{
    "first_name": "First Name",
    "very_long": "This is a very long value, in fact it is long enough to be truncated"
}
''';

const formattedExample = r'''
{
    "first_name": "some tricky\nformatting"
}
''';

void main() {
  test('can generate string consts', () {
    final generator = StringConstGenerator();
    final buffer = StringBuffer();
    generator.makeResource(json.decode(example) as Map<String, Object>, buffer);

    expect(buffer.toString(),
        "  // First Name\n  static const FIRST_NAME = 'first_name';\n\n  // Log in\n  static const LOG_IN = 'log_in';\n\n");
  });

  test('can generate when formatted values', () {
    final generator = StringConstGenerator();
    final buffer = StringBuffer();
    generator.makeResource(
        json.decode(formattedExample) as Map<String, Object>, buffer);

    expect(buffer.toString(),
        "  // some tricky\\nformatting\n  static const FIRST_NAME = 'first_name';\n\n");
  });
}
