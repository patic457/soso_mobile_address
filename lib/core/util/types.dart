typedef InputTextOnSaved = void Function(String? val);
typedef InputTextOnValidate = String? Function(String? val);
typedef SubmitButtonOnPressed = void Function();
typedef InputTextOnChanged = void Function(String)?;
typedef InputTextOnTap = void Function()?;

enum AddressSearchTypes {
  subDistrict,
  district,
  province,
  postalCode,
}

class Nullable<T> {
  final T? _value;

  const Nullable(this._value);

  T? get value => _value;
}
