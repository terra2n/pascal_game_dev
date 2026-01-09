# 🎮 Pascal Game Dev Forum Mobile

**Pascal Game Dev Forum Mobile** adalah platform komunitas berbasis mobile yang dirancang untuk pengembang game berkolaborasi, berbagi portofolio, dan memecahkan masalah teknis. Aplikasi ini dibangun dengan standar industri yang ketat untuk memastikan skalabilitas dan kemudahan pemeliharaan (*maintainability*).

---

## 📑 Daftar Isi

1. [Overview & Fitur](#-key-features)
2. [Tech Stack & Arsitektur](#-tech-stack--architecture)
3. [Struktur Proyek](#-project-structure)
4. [Setup & Instalasi](#-getting-started)
5. [Panduan Kontribusi (SOP)](https://www.google.com/search?q=%23-development-workflow--sop)
6. [Troubleshooting](#-troubleshooting)
7. [Roadmap & Status Pengerjaan](#-roadmap--progress)

---

## ✨ Key Features

* 🔐 **User Authentication**: Login, Register, Verifikasi Email & Forgot Password yang aman.
* 💬 **Discussion Threads**: Forum diskusi interaktif dengan kategori topik (Unity, Unreal, Pixel Art, dll).
* 👤 **Developer Profile**: Halaman profil untuk showcase skill dan proyek member.
* 🔍 **Advanced Search & Filter**: Temukan solusi teknis dengan cepat.
* 🔔 **Real-time Activity**: Notifikasi balasan dan aktivitas komunitas (Planned).

---

## 🛠 Tech Stack & Architecture

Kami menerapkan **Feature-First Clean Architecture** untuk menjaga kode tetap modular dan *testable*.

| Komponen | Teknologi / Library |
| --- | --- |
| **Language** | Dart |
| **Framework** | Flutter |
| **State Management** | `flutter_bloc` |
| **Architecture** | Clean Architecture (Data, Domain, Presentation) |
| **Networking** | `dio` (Interceptor & Error Handling) |
| **Routing** | `go_router` |
| **Code Gen** | `freezed` & `json_serializable` |
| **Local Storage** | `hive` |
| **Dependency Injection** | `get_it` |

---

## 📂 Project Structure

Struktur folder disusun berdasarkan fitur. Setiap fitur adalah "mini-app" yang memiliki layer Data, Domain, dan Presentation sendiri.

```bash
lib/
├── core/                       # 🟢 SHARED KERNEL (Kode yang digunakan lintas fitur)
│   ├── constants/              # Global Constants (RoutePaths, AssetPaths)
│   ├── error/                  # Failure definitions & standard error handling
│   ├── network/                # External Service Clients (Dio, Setup Interceptors)
│   ├── theme/                  # Design System (Colors, TextStyles, ThemeConfig)
│   ├── utils/                  # Helper Functions (Validators, DateFormatters)
│   └── widgets/                # Reusable UI Components (PrimaryButton, InputField)
│
├── features/                   # 📦 FEATURE MODULES (Setiap fitur bersifat mandiri)
│   ├── auth/                   # [Contoh: Modul Autentikasi]
│   │   ├── data/               # 🔴 DATA LAYER: Mengelola akses data (API, Local DB)
│   │   ├── domain/             # 🟡 DOMAIN LAYER: Aturan bisnis murni (Entities, UseCases)
│   │   └── presentation/       # 🔵 PRESENTATION LAYER: UI & State Management (Bloc)
│   │
│   └── ...                     # Fitur lainnya (Home, Forum, Profile)
│
├── routes/                     # 🚦 APP ROUTING (Konfigurasi navigasi global/GoRouter)
├── main.dart                   # Entry Point aplikasi
└── injection_container.dart    # 💉 DEPENDENCY INJECTION (Setup Locator/GetIt)
```

---

## 🚀 Getting Started

Ikuti langkah ini untuk menjalankan aplikasi di lingkungan lokal:

### 1. Prerequisites

Pastikan environment Anda sudah siap:
* **Flutter SDK**: Versi 3.x.x (Stable)
* **IDE**: VS Code (Recommended) atau Android Studio
* **Extensions**:
  * Flutter & Dart
  * Flutter Intl (Optional, untuk i18n)

### 2. Installation

```bash
# Clone Repository
git clone https://github.com/username-anda/pascal-game-dev-forum.git
cd pascal-game-dev-forum

# Install Dependencies
flutter pub get
```

### 3. Setup Environment Variables

Jika proyek ini memerlukan API Key atau konfigurasi rahasia:
1. Duplikat file `.env.example` menjadi `.env`.
2. Isi kredensial yang diperlukan pada file `.env`.

### 4. Code Generation

Karena kita menggunakan `freezed` dan `json_serializable`, jalankan perintah ini setiap ada perubahan pada Model atau State:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Running the App

```bash
# Debug Mode
flutter run
```

### 6. Test Credentials (Uji Coba)

Gunakan akun berikut untuk masuk ke dalam aplikasi tanpa registrasi (Mock Data):

* **Email**: `test@email.com`
* **Password**: `password`

---

## 🤝 Development Workflow & SOP

Agar codebase tetap bersih, seluruh tim **WAJIB** mengikuti aturan ini.

### 1. The "Golden Rules" of Dependency

* ✅ **Domain** murni Dart (No Flutter UI, No API Libraries).
* ✅ **Data** & **Presentation** bergantung pada **Domain**.
* ⛔ **Presentation** DILARANG akses **Data** (API) secara langsung. Harus lewat Bloc → UseCase.

### 2. Penempatan Widget

* **`lib/core/widgets/`**: Widget "bodoh" yang generik dan dipakai >1 fitur (Contoh: `PrimaryButton`).
* **`lib/features/.../widgets/`**: Widget spesifik yang mengandung logika fitur tersebut (Contoh: `LoginForm`, `ThreadCard`).

### 3. Tahapan Menambah Fitur Baru (Step-by-Step)

Saat membuat fitur baru (misal: `features/forum`), kerjakan dengan urutan:

1. **DOMAIN (The Contract)**: Buat Entity → Repository Interface → Usecases.
2. **DATA (The Implementation)**: Buat Model → RemoteDataSource (API) → Repository Impl.
3. **PRESENTATION (The UI)**: Buat Bloc → Pages → Widgets.
4. **INJECTION**: Daftarkan semua class di `injection_container.dart`.

### 4. Git Convention

Gunakan [Conventional Commits](https://www.conventionalcommits.org/) untuk pesan commit yang jelas:

* `feat: add login functionality`
* `fix: resolve crash on logout`
* `ui: update profile header design`
* `refactor: clean up auth bloc`
* `docs: update troubleshooting guide`

---

## 🐛 Troubleshooting

Masalah yang sering terjadi dan solusinya:

**Build Runner Error / Konflik**:
Jika terjadi error saat generate code, cobalah bersihkan cache:
```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

**Podfile Out of Sync (iOS)**:
Jika bermasalah saat build di iOS:
```bash
cd ios && pod install && cd ..
```

---

## 🗺 Roadmap & Progress

Berikut adalah status pengembangan saat ini.

### 🟢 Phase 1: Authentication (Current Sprint)
Status: **Ready for Review / Testing**

* [x] **Setup Core**: Folder structure, Theming, Networking, DI.
* [x] **Domain Layer**: Entity User, Usecases (Login, Register, Forgot Pass).
* [x] **Data Layer**: Models, API Integration, Repository Impl.
* [x] **UI Layer**: Login, Register, & Welcome Pages.
* [x] **Logic**: AuthBloc Integration.

### 🟡 Phase 2: Home & Forum (Next)
Status: **In Progress**

* [x] **Home UI**: Setup Bottom Navigation Bar & Drawer.
* [x] **Header UI**: Implementasi Tall Header & Layout Home.
* [ ] **Forum Data**: Model Thread/Post, API `getThreads`.
* [ ] **Forum Logic**: Filter topik (Unity, Unreal, dll).
* [ ] **Create Post**: Integrasi Rich Text Editor.

### ⚪ Phase 3: User Profile & Gamification
Status: **Backlog**

* [ ] **Profile UI**: Menampilkan avatar, bio, dan portofolio.
* [ ] **Edit Profile**: Update data user ke API.
* [ ] **Badge System**: Menampilkan achievement user.

---

### 📝 Catatan Penting untuk Developer

> *Jika Anda menemukan error saat `build_runner`, pastikan tidak ada impor yang melingkar (circular imports) dan file `.g.dart` atau `.freezed.dart` tidak dimodifikasi secara manual.*

> Built with ❤️ by Pascal Game Dev Team