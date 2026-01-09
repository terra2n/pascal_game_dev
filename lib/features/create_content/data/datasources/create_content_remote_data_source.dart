abstract class CreateContentRemoteDataSource {
  Future<bool> createPost({
    required String title,
    required String body,
    String? link,
    List<String>? tags,
  });
}

class CreateContentRemoteDataSourceImpl implements CreateContentRemoteDataSource {
  @override
  Future<bool> createPost({
    required String title,
    required String body,
    String? link,
    List<String>? tags,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    // Simulate success (always true for mock)
    return true;
  }
}
