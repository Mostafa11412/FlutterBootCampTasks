# Clean Architecture Task

A Flutter project implementing **Clean Architecture** with **Cubit for State Management**, **Dio for API requests**, and **Injectable for Dependency Injection**.

## 💂 Project Structure

The project follows **Clean Architecture** principles, separating concerns into different layers:

```
lib/
│── core/                  # Core utilities and DI setup
│   ├── di/                # Dependency Injection setup
│   │   ├── di.dart
│   │   ├── di.config.dart
│── data/                  # Data layer (API calls, local DB)
│   ├── dataSource/        # Data sources (remote/local)
│   │   ├── users_Dao.dart
│   ├── model/             # Data models
│   │   ├── user_model.dart
│── domain/                # Business logic layer (Entities & UseCases)
│   ├── entities/          # Entity definitions
│   │   ├── user_entity.dart
│── repo/                  # Repository implementation
│   ├── getUsers.dart
│── global_widgets/        # Shared UI components
│   ├── custom_button.dart
│   ├── text_form_field.dart
│── view/                  # UI (presentation layer)
│   ├── home/
│   │   ├── cubit/         # State Management (Cubit)
│   │   │   ├── user_cubit.dart
│   │   │   ├── user_state.dart
│   │   ├── home_page.dart
│── main.dart              # App entry point
```



## 🛠️ Tech Stack
- **State Management**: Flutter Bloc (Cubit)
- **API Calls**: Dio
- **Dependency Injection**: Injectable + GetIt
- **UI**: Flutter ScreenUtil (for responsive design)

