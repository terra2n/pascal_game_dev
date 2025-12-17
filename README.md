# Pascal Game Dev Forum Mobile

## 📖 Project Overview

Pascal Game Dev Forum Mobile adalah aplikasi mobile berbasis komunitas yang dirancang khusus untuk para pengembang game (Game Developers). Aplikasi ini bertujuan menjadi wadah diskusi, berbagi portofolio, troubleshooting teknis, dan kolaborasi antar developer.

Aplikasi ini dibangun menggunakan Flutter dengan pendekatan arsitektur yang scalable dan modular untuk memudahkan kolaborasi tim jangka panjang.

## ✨ Key Features

- **User Authentication**: Login & Register aman untuk member komunitas.
- **Discussion Threads**: Membuat, membaca, dan membalas topik diskusi seputar Game Dev.
- **Topic Filtering**: Kategorisasi diskusi berdasarkan topik (e.g., Unity, Unreal, Pixel Art, Audio).
- **Developer Profile**: Halaman profil user untuk memamerkan skill dan proyek.
- **Real-time Updates**: Notifikasi untuk balasan dan aktivitas baru (Planned).

## 🛠 Tech Stack & Architecture

Kami menggunakan standar industri terkini untuk menjaga codebase tetap bersih dan mudah di-maintain.

- **Framework**: Flutter (Dart)
- **Architecture**: Feature-First (Clean Architecture inspired)
- **State Management**: Flutter Bloc / Riverpod (Pilih salah satu & sesuaikan)
- **Networking**: Dio (dengan Interceptors & Error Handling)
- **Routing**: GoRouter
- **Code Generation**: Freezed & JSON Serializable
- **Local Storage**: Hive / Shared Preferences

## ⚙️ Prerequisites

Sebelum memulai, pastikan environment lokal Anda sudah siap:

- **Flutter SDK**: Versi 3.x.x atau terbaru (Install Guide)
- **Dart SDK**: Terinstall otomatis bersama Flutter.
- **IDE**: VS Code (Recommended) atau Android Studio.
- **Extensions**:
  - Flutter & Dart Extensions
  - Flutter Intl (untuk i18n/bahasa - opsional)

## 🚀 Getting Started

Ikuti langkah ini untuk menjalankan aplikasi di lokal:

### Clone Repository

```bash
git clone https://github.com/username-anda/pascal-game-dev-forum.git
cd pascal-game-dev-forum
```

### Install Dependencies

```bash
flutter pub get
```

### Setup Environment Variables (Jika ada)

- Duplikat file `.env.example` menjadi `.env`
- Isi kredensial API yang diperlukan.

### Run Code Generator (Penting!)

Karena kita menggunakan freezed atau json_serializable, jalankan perintah ini setiap ada perubahan model:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Jalankan Aplikasi

```bash
flutter run
```

## 📂 Project Structure

Struktur folder disusun berdasarkan Fitur (Feature-First) agar modular. Setiap fitur memiliki layer Data, Domain, dan Presentation masing-masing.

```
lib/
├── core/                   # Komponen global (Styles, Constants, Shared Widgets, Error Handling)
│   ├── theme/              # Konfigurasi warna dan font
│   └── utils/              # Helper functions
│
├── features/               # Fitur-fitur utama aplikasi
│   ├── auth/               # Login, Register, Logout
│   │   ├── data/           # API calls & Models
│   │   ├── domain/         # Entities & Repositories interfaces
│   │   └── presentation/   # Pages & State Management
│   │
│   ├── forum/              # List thread, create post, comments
│   └── profile/            # User profile, settings
│
├── main.dart               # Entry point & Dependency Injection setup
└── routes/                 # Konfigurasi navigasi (GoRouter)
```

## ⚡ Development Commands

Perintah yang sering digunakan saat development untuk mempercepat alur kerja:

| Command | Deskripsi |
|---------|-----------|
| `flutter pub get` | Menginstall library baru yang ditambahkan di pubspec.yaml. |
| `dart run build_runner build` | Generate file .g.dart atau .freezed.dart satu kali. |
| `dart run build_runner watch` | Auto-generate file saat coding (real-time watch). |
| `flutter analyze` | Cek potensi error, bug, dan style code (Linter). |
| `flutter test` | Menjalankan unit test untuk memastikan logika benar. |

## 🤝 Contributing & Workflow

Kami menyambut kontribusi teman-teman! Harap ikuti panduan berikut agar kolaborasi berjalan rapi:

### 1. Branching Strategy

Gunakan format nama branch yang deskriptif:

- `feature/nama-fitur-singkat` (Contoh: `feature/login-screen`, `feature/add-comment`)
- `fix/nama-bug` (Contoh: `fix/crash-on-logout`)
- `hotfix/critical-issue` (Untuk perbaikan darurat di production)

### 2. Commit Message

Kami menggunakan standar Conventional Commits:

```
feat: add login page UI
fix: resolve null error on profile
docs: update readme installation guide
refactor: clean up widget structure
```

### 3. Pull Request (PR)

- Pastikan kode tidak ada error dengan menjalankan `flutter analyze`.
- Jelaskan apa yang diubah pada deskripsi PR.
- Lampirkan screenshot jika ada perubahan tampilan UI.
- Minta review dari minimal 1 maintainer sebelum merge.

## 🐛 Troubleshooting

Masalah umum:

**Podfile out of sync (iOS)**:
Jalankan perintah berikut di terminal:

```bash
cd ios && pod install && cd ..
```

**Build Runner error / Konflik**:
Coba bersihkan cache dan jalankan ulang:

```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

## 📄 License

Project ini dilisensikan di bawah MIT License.