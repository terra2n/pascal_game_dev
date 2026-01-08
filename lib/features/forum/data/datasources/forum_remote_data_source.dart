import '../models/thread_model.dart';

abstract class ForumRemoteDataSource {
  Future<List<ThreadModel>> getThreads();
}

class ForumRemoteDataSourceImpl implements ForumRemoteDataSource {
  @override
  Future<List<ThreadModel>> getThreads() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Dummy Data
    return [
      ThreadModel(
        id: '1',
        title: 'Cara optimalisasi Unity di Android?',
        content: 'Ada yang punya tips settingan grafis biar ga ngelag di HP kentang?',
        author: 'IndieDev123',
        category: 'Unity',
        likesCount: 15,
        commentCount: 4,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      ThreadModel(
        id: '2',
        title: 'Showcase Pixel Art Character',
        content: 'Baru belajar bikin pixel art, minta feedback dong suhu!',
        author: 'ArtMaster',
        category: 'Pixel Art',
        likesCount: 32,
        commentCount: 12,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ThreadModel(
        id: '3',
        title: 'Unreal Engine 5 Blueprint Tutorial',
        content: 'Share link tutorial bagus buat pemula UE5 dong.',
        author: 'NewbieUE',
        category: 'Unreal',
        likesCount: 8,
        commentCount: 2,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }
}
