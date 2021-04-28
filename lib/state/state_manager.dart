import 'package:anna_comic/model/chapters.dart';
import 'package:anna_comic/model/comic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final comicSelected = StateProvider((ref) => Comic());
final chapterSelected = StateProvider((ref) => Chapters());
