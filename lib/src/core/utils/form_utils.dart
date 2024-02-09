final class FormTypeKeys {
  static const String text = 'TEXT';
  static const String textarea = 'TEXTAREA';
  static const String email = 'EMAIL';
  static const String password = 'PASSWORD';
  static const String integer = 'INTEGER';
  static const String decimal = 'DECIMAL';
  static const String date = 'DATE';
  static const String dateTime = 'DATE_TIME';
  static const String boolean = 'BOOLEAN';
}

// enum FormType {
//   text,
//   textarea,
//   email,
//   password,
//   integer,
//   decimal,
//   date,
//   dateTime,
//   boolean,
// }

// extension FormTypeX on FormType {
//   String get value {
//     final String value = switch (this) {
//       FormType.text => 'text',
//       FormType.textarea => 'textarea',
//       FormType.email => 'email',
//       FormType.password => 'password',
//       FormType.integer => 'integer',
//       FormType.decimal => 'decimal',
//       FormType.date => 'date',
//       FormType.dateTime => 'date_time',
//       FormType.boolean => 'boolean',
//     };
//     return value.toUpperCase();
//   }

//   String get label {
//     final String label = switch (this) {
//       FormType.text => 'Text',
//       FormType.textarea => 'Textarea',
//       FormType.email => 'Email',
//       FormType.password => 'Password',
//       FormType.integer => 'Integer',
//       FormType.decimal => 'Decimal',
//       FormType.date => 'Date',
//       FormType.dateTime => 'Date Time',
//       FormType.boolean => 'Boolean',
//     };
//     return label;
//   }
// }

// FormType enumFromString(String key) => switch (key) {
//       'text' => FormType.text,
//       'textarea' => FormType.textarea,
//       'email' => FormType.email,
//       'password' => FormType.password,
//       'integer' => FormType.integer,
//       'decimal' => FormType.decimal,
//       'date' => FormType.date,
//       'date_time' => FormType.dateTime,
//       'boolean' => FormType.boolean,
//       _ => throw Exception('Invalid FormType'),
//     };
