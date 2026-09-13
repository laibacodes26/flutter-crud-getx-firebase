# Day 22 - Firestore CRUD (Create, Read, Update, Delete) with GetX + MVC

## Setup
1. Run `flutter pub get`
2. Connect this project to your own Firebase project:
   - Install FlutterFire CLI: `dart pub global activate flutterfire_cli`
   - Run `flutterfire configure` in this project's root and select/create your Firebase project
   - This generates `lib/firebase_options.dart` and the native config files
   - If you generate `firebase_options.dart`, update `main.dart`:
     `await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);`
3. In Firebase Console, create a Firestore database (test mode is fine for coursework) with a `users` collection.
4. Run `flutter run`

## Structure
- `models/user_model.dart` - UserModel (id, name, email, age)
- `services/user_service.dart` - Firestore create/read/update/delete calls
- `controllers/user_controller.dart` - GetX reactive state, calls the service, shows snackbars
- `views/home_view.dart` - user list + search + add button
- `views/add_user_view.dart` - Create screen
- `views/edit_user_view.dart` - Update screen (pre-filled form)
- `widgets/user_card.dart` - list item with Edit/Delete buttons
- `widgets/delete_confirm_dialog.dart` - Get.dialog confirmation before delete
- `theme/neon_theme.dart` - shared neon-glass styling (reused from your login/signup project)

## CRUD flow
- Create: Home -> + button -> Add User -> Firestore add() -> list updates automatically (stream)
- Read: Home screen streams the `users` collection live via GetX .obs
- Update: Home -> Edit icon -> Edit User (pre-filled) -> Firestore update() -> list updates, snackbar
- Delete: Home -> Delete icon -> confirm dialog -> Firestore delete() -> list updates, snackbar
