import '../models/inspirasi_model.dart';

abstract class InspirasiRemoteDataSource {
  Future<List<InspirasiModel>> getInspirations();
}

class InspirasiRemoteDataSourceImpl implements InspirasiRemoteDataSource {
  @override
  Future<List<InspirasiModel>> getInspirations() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Dummy Data based on the UI request
    // Since we don't have the exact image assets, we'll use a placeholder or assume assets exist.
    // Ideally, we'd use 'assets/inspirasi/image1.png' etc., but I'll use a network placeholder for safety or a generic local asset if I knew one.
    // For now, I will use a placeholder URL or just strings, assuming the UI will handle it (or use a color/gradient fallback).
    
    return [
      const InspirasiModel(
        id: '1',
        title: "The 'Grup 7' Creator Still Doesn't How",
        author: 'Person',
        imageAsset: 'assets/images/placeholder_1.png', // Placeholder
        timestamp: '10m',
      ),
      const InspirasiModel(
        id: '2',
        title: "The 'Grup 7' Creator Still Doesn't How",
        author: 'Person',
        imageAsset: 'assets/images/placeholder_2.png',
        timestamp: '10m',
      ),
      const InspirasiModel(
        id: '3',
        title: "The 'Grup 7' Creator Still Doesn't How",
        author: 'Person',
        imageAsset: 'assets/images/placeholder_3.png',
        timestamp: '10m',
      ),
      const InspirasiModel(
        id: '4',
        title: "The 'Grup 7' Creator Still Doesn't How",
        author: 'Person',
        imageAsset: 'assets/images/placeholder_4.png',
        timestamp: '10m',
      ),
    ];
  }
}
