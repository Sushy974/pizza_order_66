import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput].
enum MotDePasseValidationError {
  /// Generic invalid error.
  invalid
}

///Genere le texte d'erreur
extension MotDePasseValidationText on MotDePasseValidationError {
  /// The error message to display to the user.
  String text() {
    switch (this) {
      case MotDePasseValidationError.invalid:
        return '''Password must contain at least 8 characters, and include at least one letter, one number, and one special character.''';
    }
  }
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class MotDePasse extends FormzInput<String, MotDePasseValidationError> {
  /// {@macro password}
  const MotDePasse.pure() : super.pure('');

  /// {@macro password}
  const MotDePasse.dirty([super.value = '']) : super.dirty();

  @override
  MotDePasseValidationError? validator(String? value) {
    return value?.isEmpty ?? false ? MotDePasseValidationError.invalid : null;
  }
}
