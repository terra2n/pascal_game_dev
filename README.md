# Pascal Game Dev Forum Mobile

## 📖 Project Overview

Pascal Game Dev Forum Mobile adalah aplikasi mobile berbasis komunitas yang dirancang khusus untuk para pengembang game (Game Developers). Aplikasi ini bertujuan menjadi wadah diskusi, berbagi portofolio, troubleshooting teknis, dan kolaborasi antar developer.

Aplikasi ini dibangun menggunakan Flutter dengan pendekatan arsitektur yang scalable dan modular untuk memudahkan kolaborasi tim jangka panjang.

## ✨ Key Features

- **User Authentication**: Login, Register, Forgot Password, & Email Verification aman untuk member komunitas.
- **Discussion Threads**: Membuat, membaca, dan membalas topik diskusi seputar Game Dev.
- **Topic Filtering**: Kategorisasi diskusi berdasarkan topik (e.g., Unity, Unreal, Pixel Art, Audio).
- **Developer Profile**: Halaman profil user untuk memamerkan skill dan proyek.
- **Real-time Updates**: Notifikasi untuk balasan dan aktivitas baru (Planned).

## 🛠 Tech Stack & Architecture

Kami menggunakan standar industri terkini untuk menjaga codebase tetap bersih dan mudah di-maintain.

- **Framework**: Flutter (Dart)
- **Architecture**: Feature-First (Clean Architecture inspired)
- **State Management**: Flutter Bloc (menggunakan library `flutter_bloc`)
- **Networking**: Dio (dengan Interceptors & Error Handling)
- **Routing**: GoRouter
- **Code Generation**: Freezed & JSON Serializable
- **Local Storage**: Hive

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
├── core/                       # 🟢 Shared code (bisa diakses semua fitur)
│   ├── error/                  # Definisi Error/Failure (misal: ServerFailure, ConnectionFailure)
│   ├── network/                # Konfigurasi Dio & Interceptor
│   ├── usecases/               # Interface UseCase dasar
│   ├── utils/                  # Helper (DateFormatter, Validator)
│   ├── theme/                  # AppTheme, Colors, Typography
│   └── widgets/                # Widget umum (CustomButton, CustomTextField, LoadingSpinner)
│
├── features/                   # 📦 Modules (Fitur-fitur aplikasi)
│   ├── auth/                   # Contoh Fitur: Authentication
│   │   ├── data/               # Layer Data (Akses ke API/DB)
│   │   │   ├── datasources/    # RemoteDataSource (API) & LocalDataSource (Cache)
│   │   │   ├── models/         # Model Data (JSON serialization / fromJson)
│   │   │   └── repositories/   # Implementasi Repository (auth_repository_impl.dart)
│   │   │
│   │   ├── domain/             # Layer Domain (Aturan Bisnis Murni) - TIDAK BOLEH ADA FLUTTER CODE
│   │   │   ├── entities/       # Objek murni yang dipakai UI (UserEntity)
│   │   │   ├── repositories/   # Interface Repository (auth_repository.dart) - Kontrak
│   │   │   └── usecases/       # Logika spesifik (login_user.dart, register_user.dart)
│   │   │
│   │   └── presentation/       # Layer Tampilan
│   │       ├── bloc/           # State Management (auth_bloc.dart, auth_event.dart, auth_state.dart)
│   │       ├── pages/          # Halaman Screens (login_page.dart)
│   │       └── widgets/        # Widget khusus fitur ini (misal: login_form.dart)
│   │
│   └── forum/                  # Fitur lain (strukturnya sama persis: data, domain, presentation)
│
├── main.dart                   # Entry point
└── injection_container.dart    # Setup Dependency Injection (Service Locator/GetIt)
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

### 4. Aturan Menambah Modul (Fitur Baru)

Saat Anda ingin membuat fitur baru (misalnya fitur "Notification"), ikuti aturan urutan pengerjaan ini agar dependency tetap bersih.

**Langkah 1: Buat Folder Fitur**
Buat folder `lib/features/notification/`. Di dalamnya buat 3 sub-folder wajib: `domain`, `data`, `presentation`.

**Langkah 2: Kerjakan Layer DOMAIN dulu (The Core)**
Ini aturan "Clean Architecture". Mulailah dari bisnis proses, bukan UI.

- **Entities**: Buat `notification_entity.dart`. Ini objek polosan (bukan JSON).
- **Repository Interface**: Buat `notification_repository.dart` (abstract class). Tentukan fitur ini bisa ngapain aja (misal: `getNotifications()`, `markAsRead()`).
- **UseCases**: Buat file untuk setiap aksi, misal `get_notifications_usecase.dart`.

Kenapa Domain dulu? Agar logika bisnis Anda matang sebelum memikirkan tampilan atau API.

**Langkah 3: Kerjakan Layer DATA**
Setelah kontrak (interface) di Domain jadi, barulah kita implementasikan.

- **Models**: Buat `notification_model.dart` (turunan dari Entity). Tambahkan fungsi `fromJson` dan `toJson`.
- **Data Sources**: Buat `notification_remote_data_source.dart`. Di sini panggil Dio (API Endpoint).
- **Repository Implementation**: Buat `notification_repository_impl.dart`. Gabungkan Data Source dengan Repository Interface dari Domain.

**Langkah 4: Kerjakan Layer PRESENTATION**
Terakhir, buat UI-nya.

- **Bloc**: Buat `notification_bloc.dart`. Panggil UseCase di sini.
- **Pages**: Buat `notification_page.dart`. Gunakan `BlocBuilder` untuk merender UI berdasarkan state.

### 5. Aturan Components (Widget)
Seringkali developer bingung: "Widget ini taruh di core atau di features?"

**Aturan Emas:**

**Shared Widgets (`lib/core/widgets/`):**
Jika widget itu generik, bodoh (tidak ada logika bisnis berat), dan dipakai di lebih dari satu fitur.
*Contoh: PrimaryButton, CustomTextField, ErrorView, LoadingIndicator.*

**Feature Widgets (`lib/features/auth/presentation/widgets/`):**
Jika widget itu spesifik hanya untuk fitur tersebut.
*Contoh: LoginForm (hanya ada di Auth), ThreadCard (hanya ada di Forum), ProfileHeader (hanya ada di Profile).*

### 6. Dependency Rules (PENTING)
Agar arsitektur tidak rusak, perhatikan arah panah import-nya:

- ✅ **Domain** tidak boleh import apapun dari Data atau Presentation. (Domain harus bersih, murni Dart).
- ✅ **Data** meng-import Domain (karena dia mengimplementasikan repository domain).
- ✅ **Presentation** meng-import Domain (karena dia memanggil UseCase).
- ✅ **Presentation TIDAK BOLEH** meng-import Data (UI tidak boleh akses API langsung, harus lewat Bloc -> UseCase).

### 7. Summary Checklist untuk Tim Anda
Saat Code Review, cek 3 hal ini:

- [ ] Apakah fitur baru sudah punya folder data, domain, presentation?
- [ ] Apakah file Entity (Domain) bersih dari kode JSON atau package Flutter UI?
- [ ] Apakah UI (Page) memanggil Logic (Bloc), bukan memanggil API langsung?

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