# Shopping App

This is a Flutter-based shopping application that allows users to sign up, sign in, and browse products. The app integrates with Firebase for authentication and supports multi-language functionality using the `easy_localization` package.

## Features

- **User Authentication**: Sign up and sign in using Firebase Authentication.
- **Multi-language Support**: Supports English and Arabic languages.
- **Product Browsing**: View products in different layouts (PageView, GridView, ListView).
- **Responsive Design**: Adapts to different screen sizes and orientations.
`

## Project Structure

- **`lib/`**: Contains the main application code.
  - **`view/`**: Contains the UI screens.
    - **`authentication/`**: Sign-in and sign-up screens.
    - **`homePage.dart`**: Main screen after authentication.
  - **`widgets/`**: Reusable widgets like buttons, form fields, and product displays.
  - **`fireBase_Services/`**: Firebase authentication services.
- **`lang/`**: Contains localization files for English and Arabic.
- **`main.dart`**: Entry point of the application.

## Usage

### Sign Up
1. Open the app.
2. Navigate to the Sign Up screen.
3. Enter your full name, email, and password.
4. Confirm your password and submit the form.
5. Upon successful registration, you will be redirected to the home page.

### Sign In
1. Open the app.
2. Enter your email and password.
3. Submit the form.
4. Upon successful login, you will be redirected to the home page.

### Browsing Products
- **PageView**: Swipe horizontally to view featured products.
- **GridView**: View products in a grid layout.
- **ListView**: Scroll horizontally to view hot offers.

## Localization

The app supports English and Arabic. The language can be changed using the language trigger button in the app bar.

## Dependencies

- **`easy_localization`**: For multi-language support.
- **`firebase_core`**: For Firebase integration.
- **`firebase_auth`**: For user authentication.

