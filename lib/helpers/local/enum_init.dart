abstract class Enum<T> {
  final T _value;

  const Enum(this._value);

  T get value => _value;
}

class CachingKey extends Enum<String> {
  const CachingKey(String val) : super(val);
  static const String userData = 'userData';
  static const String isFirstInstall = 'isFirstInstall';
  static const String verified = 'verified';

}
