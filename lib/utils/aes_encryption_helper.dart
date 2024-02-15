import 'package:encrypt/encrypt.dart';

class AESEncryptionHelper{

  static get _key => Key.fromBase64('anVzdCBsZW5ndGgga2V5IGZsdXR0ZXJjb3JlMmJldGE=');

  static get _iv => IV.fromBase64('WVc1V2VtUkRRbk5hVnpWdQ==');

  static get _encrypter => Encrypter(AES(_key, padding: null));

  static String encrypt(String text) {
    final encrypted = _encrypter.encrypt(text, iv: _iv);
    return encrypted.base64;
  }

  static String decrypt(String text) {
    final decrypted = _encrypter.decrypt(Encrypted.fromBase64(text), iv: _iv);
    return decrypted;
  }
}