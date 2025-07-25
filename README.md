# 🍽️ DishDash – Flutter with Local Database

A Flutter-based mobile application that displays meals and food categories. This app uses **local storage** via `sqflite` to store and retrieve data offline. It includes an onboarding experience, user data input screen, a main meal listing page, and a detail view for selected meals.

---

## 📱 App Screens

1. **Onboarding Screens** – A multi-page introduction shown on first launch.
2. **User Info Screen** – A form where the user enters name, preferences, etc.
3. **Home Screen** – Displays a list of meals fetched from a local SQLite database.
4. **Detail Screen** – Shows full details about a selected meal.

---

## 🛠️ Features

- 🧠 **Local Database with SQLite** using [`sqflite`](https://pub.dev/packages/sqflite) to store meals and user data.
- 🎬 **Onboarding Flow** implemented using `PageView` and persisted with `shared_preferences`.
- 👤 **User Data Form** with validation and local storage.
- 🧩 **Modular & Reusable Widgets** for buttons, cards, and form fields.
- ⚙️ **Offline Support** – All data is stored locally, no internet required after first run.

---

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

```bash
git clone https://github.com/OmarSdowek/DishDash
cd meal-app-flutter
flutter pub get
flutter run


