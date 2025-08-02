

import 'dart:io';

extension FileName on File {
  String get fileName => path.split('/').last;
}