import 'dart:convert';
import 'dart:typed_data';
import 'package:enough_convert/enough_convert.dart';

String ConvertBytesToString(List<int> codes, {bool utf8 = true}) {
  try {
    final str =
        utf8 ? Utf8Decoder().convert(codes) : String.fromCharCodes(codes);
    return str;
  } catch (err) {
    try {
      final str = GbkCodec(allowInvalid: false).decode(codes);
      return str;
    } catch (gbkError) {
      // If the string is not a valid UTF8 string or gbk string, decode it as character codes.
      return String.fromCharCodes(codes);
    }
  }
}
