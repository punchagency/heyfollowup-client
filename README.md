# ✨ Project Handover: HeyFollowUp!

**Project Name:** HeyFollowUp!  
**Handover Date:** March 21, 2025  
**Author:** Adewale  

---

## 📂 Project Overview
This is a **Flutter application** built for the purpose of following up with schedules.. The app supports **Android and iOS** with state management using **Provider** and backend communication via **http**.

---

## 🚀 Tech Stack
- **Flutter Version:** `3.29.1`
- **Dart Version:** `2.7.0`
- **State Management:** `Provider`
- **Networking:** `Http`
- **Database:** `SharedPreferences`

---

## 💚 Setup Guide
### **🔹 1. Clone the Repository**
```sh
git clone https://github.com/punchagency/heyfollowup-client.git
cd hey_follow_up
```

### **🔹 2. Install Dependencies**
```sh
flutter pub get
```


## 🛠️ Running the App
### **🔹 Run on Android**
```sh
flutter run --flavor development --target lib/main.dart
```
### **🔹 Run on iOS**
```sh
cd ios
pod install
cd ..
flutter run
```

---

## 📦 Project Structure
```
my_flutter_app/
│── lib/
│   ├── main.dart          # Main entry point
│   ├── core/              # App-wide utilities and themes
│   ├── data/              # Models, API services, and local storage
│   ├── screens/          # Feature-based module organization
│   ├── widgets/           # Reusable UI components
│── assets/                # Images, fonts, and JSON files
│── android/               # Android-specific files
│── ios/                   # iOS-specific files
│── pubspec.yaml           # Dependencies and app metadata
│── .gitignore             # Ignored files (e.g., .env)
│── README.md              # Project documentation
```

---

## 🔗 Backend & API Docs
- **API Base URL:** `https://heyfollowup-60c6683d99c1.herokuapp.com`
- **API Documentation:** `https://documenter.getpostman.com/view/42462268/2sAYdeMBxg`

---

## 🛠️ Deployment & CI/CD
- **Build & Deploy (Android)**
  ```sh
  flutter build apk --release
  ```
- **Build & Deploy (iOS)**
  ```sh
  flutter build ipa
  ```
---

