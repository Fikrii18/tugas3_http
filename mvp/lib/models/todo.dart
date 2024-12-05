import 'package:hive/hive.dart';
part 'todo.g.dart';
@HiveType(typeId: 0)
class todo extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;
  
  @HiveField(2)
  String? description;

  todo({
    required this.title,
    required this.description,
  });
}