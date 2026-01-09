import '../models/tutorial_model.dart';

abstract class TutorialRemoteDataSource {
  Future<List<TutorialModel>> getTutorials();
}

class TutorialRemoteDataSourceImpl implements TutorialRemoteDataSource {
  @override
  Future<List<TutorialModel>> getTutorials() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock Data based on the UI Request
    return [
      const TutorialModel(
        id: '1',
        title: 'Delphi XE2: Configuring your Mac to Develop, Test and Deploy iOS Apps with FireMonkey',
        category: 'FireMonkey',
        author: 'Person',
        authorAvatar: 'assets/images/avatar_placeholder.png',
        imageAsset: 'assets/images/sdl3_placeholder.png', // SDL3 Image
        description: 'Learn how to setup your Mac environment for Delphi XE2 development...',
        timestamp: '10m',
      ),
      const TutorialModel(
        id: '2',
        title: 'Tripping The Class Fantastic: State Machines',
        category: 'State Machines',
        author: 'AthenaOfDelphi',
        authorAvatar: 'assets/images/avatar_placeholder.png',
        imageAsset: '', // No hero image for this card in screenshot example 2
        description: 'This is not going to be a complete history of state machines and it certainly won\'t be a definitive guide...',
        timestamp: '10m',
      ),
      const TutorialModel(
        id: '3',
        title: 'Delphi XE2: Configuring your Mac to Develop, Test and Deploy iOS Apps with FireMonkey',
        category: 'FireMonkey',
        author: 'Person',
        authorAvatar: 'assets/images/avatar_placeholder.png',
        imageAsset: 'assets/images/sdl3_placeholder.png',
        description: 'Learn how to setup your Mac environment for Delphi XE2 development...',
        timestamp: '10m',
      ),
       const TutorialModel(
        id: '4',
        title: 'Tripping The Class Fantastic: State Machines',
        category: 'State Machines',
        author: 'AthenaOfDelphi',
        authorAvatar: 'assets/images/avatar_placeholder.png',
        imageAsset: '',
        description: 'This is not going to be a complete history of state machines...',
        timestamp: '10m',
      ),
    ];
  }
}
