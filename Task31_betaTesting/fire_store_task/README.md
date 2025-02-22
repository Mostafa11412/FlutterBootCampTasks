# Firestore Task

## Distribution

This project has been successfully built and distributed. Below are the details of the distribution process:

- The release APK was built using Gradle, generating a release build located at:
  ```
  build/app/outputs/flutter-apk/app-release.apk (20.4MB)
  ```
  ![Build Success Screenshot](Task31_betaTesting\TaskScreenShot (1).png)

- The app has been uploaded for beta testing, and invitations have been sent out. Below is the current status of the test distribution:
  ![Beta Testing Screenshot](Task31_betaTesting\TaskScreenShot (2).png)

## Overview

This project is a Flutter application that demonstrates how to interact with Firebase Firestore to save and retrieve user data. It includes a form for inputting user details (name, age, and hobby) and displays the saved data in a list.

## Features

- **Input Form**: Users can input their name, age, and favorite hobby.
- **Data Saving**: The input data is saved to Firebase Firestore.
- **Data Retrieval**: The saved data is fetched from Firestore and displayed in a list.
- **Validation**: Form fields are validated to ensure correct input.
- **State Management**: The project uses `flutter_bloc` for state management.

## Getting Started

### Project Structure

- **`lib/`**: Contains the main application code.

  - **`view/`**: Contains the UI screens.
    - `input_form_page.dart`: The input form screen.
    - `users_page.dart`: The screen to display saved users.

  - **`widgets/`**: Contains custom widgets.
    - `customButton.dart`: A custom button widget.
    - `customFormFeild.dart`: A custom form field widget.

  - **`cubit/`**: Contains the state management logic.
    - `users_cubit.dart`: Manages the state for saving and fetching users.
    - `users_state.dart`: Defines the states for the `UsersCubit`.

  - **`data/`**: Contains data models.
    - `user_model.dart`: Defines the `UserModel` class.

  - **`fireBase_Services/`**: Contains Firebase-related services.
    - `fireBase_Services.dart`: Handles Firestore operations.
    - `firebase_options.dart`: Firebase configuration file.

## Usage

1. **Input Form Page**:
   - Open the app, and you will be directed to the input form page.
   - Enter the user's name, age, and favorite hobby.
   - Click the "Save Data" button to save the data to Firestore.

2. **Users Page**:
   - Click the "View Data" button to navigate to the users page.
   - The saved users will be displayed in a list.

## Dependencies

- `flutter_bloc`: For state management.
- `firebase_core`: For Firebase core functionality.
- `cloud_firestore`: For Firestore database operations.

