# 🚀 Flutter CRUD App — GetX + Firebase Firestore

A complete **CRUD (Create, Read, Update, Delete) application** built with **Flutter**, **GetX**, **MVC Architecture**, and **Firebase Cloud Firestore**.

This project was developed as part of my **Flutter Internship at Big Brains**, focusing on building a clean, maintainable Flutter application while working with real-time cloud data and reactive state management.

---

## 📱 Project Overview

This application allows users to manage user information stored in **Firebase Cloud Firestore**.

The app implements the complete CRUD flow:

**Create → Read → Update → Delete**

Users can:

* Add new users
* View users stored in Firestore
* Edit existing user information
* Delete users with confirmation
* Validate form input
* Receive success and error feedback
* See UI updates reactively without restarting the application

---

## ✨ Features

### 🟢 Create

Add a new user with:

* Name
* Email
* Age

User information is validated before being stored in Firestore.

### 🔵 Read

* Fetch users from Firebase Cloud Firestore
* Display users in the application
* Automatically update the UI using GetX reactive state management

### 🟡 Update

* Edit existing user information
* Update Name, Email, and Age
* Validate updated information
* Update the corresponding Firestore document

### 🔴 Delete

* Delete users from Firestore
* Display a confirmation dialog before deletion
* Update the user list immediately after deletion

---

## 🛠️ Tech Stack

| Technology                   | Purpose                                                                    |
| ---------------------------- | -------------------------------------------------------------------------- |
| **Flutter**                  | Cross-platform application development                                     |
| **Dart**                     | Programming language                                                       |
| **GetX**                     | State management, navigation, dialogs, snackbars, and dependency injection |
| **Firebase Cloud Firestore** | Cloud database for storing user information                                |
| **MVC Architecture**         | Separation of UI, business logic, and data                                 |
| **Material Design**          | User interface components                                                  |

---

## 🏗️ Architecture

The application follows the **MVC (Model-View-Controller)** architecture.

```text
                    Flutter Application
                           │
                           ▼
                         View
                           │
                           ▼
                      Controller
                           │
                           ▼
                         Model
                           │
                           ▼
                   Firebase Service
                           │
                           ▼
                 Cloud Firestore
```

### Model

Responsible for representing user data.

```text
lib/models/
└── user_model.dart
```

The `UserModel` represents information such as:

* Name
* Email
* Age
* Document ID

### View

Responsible for the application's UI.

```text
lib/views/
├── home_view.dart
├── add_user_view.dart
└── edit_user_view.dart
```

### Controller

Responsible for application logic and reactive state management.

```text
lib/controllers/
└── user_controller.dart
```

The controller handles:

* Loading users
* Adding users
* Updating users
* Deleting users
* Form-related operations
* Reactive UI updates
* User feedback

### Service

Responsible for communication with Firebase Firestore.

```text
lib/services/
└── user_service.dart
```

The service handles Firestore operations such as:

* Create
* Read
* Update
* Delete

---

## 📁 Project Structure

```text
lib/
│
├── controllers/
│   └── user_controller.dart
│
├── models/
│   └── user_model.dart
│
├── routes/
│   └── app_routes.dart
│
├── services/
│   └── user_service.dart
│
├── theme/
│   └── neon_theme.dart
│
├── views/
│   ├── add_user_view.dart
│   ├── edit_user_view.dart
│   └── home_view.dart
│
├── widgets/
│   ├── delete_confirm_dialog.dart
│   └── user_card.dart
│
└── main.dart
```

---

## 🔄 CRUD Flow

### Create

```text
User enters information
        ↓
Form validation
        ↓
User Controller
        ↓
User Service
        ↓
Cloud Firestore
        ↓
UI updated
```

### Read

```text
Application starts
        ↓
User Controller
        ↓
User Service
        ↓
Cloud Firestore
        ↓
Users retrieved
        ↓
GetX updates UI
```

### Update

```text
User selects Edit
        ↓
Existing data displayed
        ↓
User modifies information
        ↓
Validation
        ↓
User Controller
        ↓
Firestore document updated
        ↓
UI refreshed reactively
```

### Delete

```text
User selects Delete
        ↓
Confirmation Dialog
        ↓
User confirms
        ↓
User Controller
        ↓
Firestore document deleted
        ↓
User list updated
```

---

## 🔥 Firebase Integration

The application uses **Firebase Cloud Firestore** as its backend database.

Each user record contains information such as:

```text
Name
Email
Age
Document ID
```

Firestore is used to perform all CRUD operations without requiring a separate backend server.

### Firebase Setup

To run this project with your own Firebase project:

1. Create a project in Firebase Console.
2. Add your Flutter/Android application.
3. Enable **Cloud Firestore**.
4. Configure Firebase for the application.
5. Add the required Firebase configuration locally.
6. Run the Flutter application.

> ⚠️ Firebase configuration files containing project-specific credentials are intentionally excluded from this repository for security reasons.

---

## 🎨 UI & Theme

The application uses a custom **Neon Theme** to provide a modern and visually engaging interface.

The theme is organized separately:

```text
lib/theme/neon_theme.dart
```

This keeps the application's visual styling separate from business logic.

---

## 📚 What I Learned

Through this project, I gained practical experience with:

* Building CRUD applications in Flutter
* Working with Firebase Cloud Firestore
* Creating and managing Firestore documents
* Working with Firestore Document IDs
* Implementing Create, Read, Update, and Delete operations
* Using GetX for reactive state management
* Managing application navigation with GetX
* Using GetX dialogs and snackbars
* Implementing form validation
* Separating business logic from UI
* Structuring applications using MVC architecture
* Creating reusable Flutter widgets
* Updating the UI reactively after database operations
* Organizing a Flutter project for maintainability

---

## 🎯 Key Learning

One of the main lessons from this project was understanding the importance of **separating UI, business logic, and data operations**.

Using MVC architecture together with GetX allowed the application to remain organized while implementing Firebase functionality.

Instead of placing Firestore operations directly inside the UI, the application separates responsibilities between:

```text
View → Controller → Service → Firestore
```

This makes the application easier to understand, maintain, and extend.

---

## ⚙️ Getting Started

### Prerequisites

Make sure you have installed:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Firebase project
* Android emulator or physical device

### Clone the Repository

```bash
git clone https://github.com/laibacodes26/flutter-crud-getx-firebase.git
```

### Navigate to the Project

```bash
cd flutter-crud-getx-firebase
```

### Install Dependencies

```bash
flutter pub get
```

### Configure Firebase

Connect the application to your own Firebase project and add the required Firebase configuration locally.

### Run the Application

```bash
flutter run
```

---

## 🔐 Security Note

Firebase configuration files are not included in this repository.

The project uses `.gitignore` to prevent sensitive Firebase configuration files from being accidentally committed.

Before publishing a Firebase project, always review your repository for credentials, private keys, environment files, and other sensitive information.

---

## 🚀 Future Improvements

Possible future improvements include:

* User authentication
* Search and filtering
* Pagination
* Image upload
* Profile management
* Offline support
* Improved Firestore security rules
* Additional animations
* Unit and widget testing

---

## 🎓 Internship

This project was developed as part of my **Flutter Internship at Big Brains**.

The project helped me gain practical experience in:

**Flutter → GetX → MVC → Firebase → Cloud Firestore → CRUD**

It was an important step in learning how to build structured and maintainable Flutter applications using real backend services.

---

## 👩‍💻 Developer

**Laiba**

Flutter Developer Intern

---

## ⭐ Acknowledgements

Special thanks to **Big Brains** for providing a structured, hands-on learning environment and internship tasks that helped me strengthen my Flutter development skills through practical project-based learning.

---

## 📌 Project Summary

```text
Project      : Flutter CRUD Application
Framework    : Flutter
Language     : Dart
State Mgmt   : GetX
Architecture : MVC
Database     : Firebase Cloud Firestore
Theme        : Neon UI
Operations   : Create • Read • Update • Delete
```

⭐ If you find this project useful, feel free to explore the repository and learn from the implementation.
