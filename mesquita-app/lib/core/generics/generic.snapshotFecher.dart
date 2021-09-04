import 'package:sagae/core/generics/generic.entity.dart';

abstract class SnapshotFetcher {
  Future<List<GenericEntity>> fetchAll(
      {List<String> sortParams, Map<String, dynamic> filterParams});
}
