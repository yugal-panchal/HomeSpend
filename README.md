# 💰 FamBudget – Family Expense Manager

FamBudget is a clean and efficient **family budget management app** built using **Flutter** and the **MVVM architecture**, powered by **GetX** for state management, dependency injection, and routing.

This app allows a designated **head of the family** to manage the shared budget, while other **members** can log expenses — with real-time balance tracking and controlled access to top-ups.

---

## 🚀 Features

- 👨‍👩‍👧‍👦 **Role-Based Access**  
  - Head of Family: Add top-ups to the shared budget  
  - Members: Log expenses but cannot modify the total budget

- 💸 **Real-Time Balance Calculation**  
  Automatically updates remaining balance as expenses are logged

- 🧾 **Transaction History**  
  View all expenses with title, amount, and timestamp

- 🧠 **MVVM Architecture**  
  Clean separation between UI, logic, and data layers

- ⚙️ **GetX Integration**  
  Lightweight state management  
  Easy navigation and controller lifecycle handling

---

## 🧱 Tech Stack

- **Flutter** – UI development  
- **GetX** – State, navigation, dependency management  
- **MVVM** – Architecture pattern for clean code  
- *(Optional)* **GetStorage / Hive / SQLite / Firebase** – For data persistence

---

## 📁 Folder Structure
lib/
├── data/ # Models and data services
│ └── models/
│ └── services/
├── domain/ # Business logic (Repositories)
│ └── repositories/
├── presentation/ # UI Layer
│ ├── controllers/ # GetX Controllers (ViewModels)
│ ├── views/ # Screens
│ ├── widgets/ # Reusable UI components
│ └── bindings/ # Bindings for dependency injection
├── routes/ # app_pages.dart and app_routes.dart
└── main.dart # App entry point

## 🧪 Planned Enhancements

- 🔐 Authentication (role-based login)  
- 📊 Monthly analytics and expense charts  
- 🌐 Firebase / Hive integration for cloud/local storage  
- 🛎️ Notifications for budget limits

---

## ✨ Screenshots *(Coming Soon)*

| Home | Add Expense | Transaction History |
| --- | --- | --- |
| ![Home](screenshots/home.png) | ![Add Expense](screenshots/add_expense.png) | ![History](screenshots/history.png) |

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork this repository  
2. Create your branch (`git checkout -b feature/my-feature`)  
3. Commit your changes (`git commit -m 'Add awesome feature'`)  
4. Push to the branch (`git push origin feature/my-feature`)  
5. Open a pull request

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 🧠 Author

**Yugal Panchal**  
[LinkedIn](https://www.linkedin.com/in/yugalpanchal/) • [Twitter](https://x.com/yugal_1005?t=Ez2CeVdWxsGMXit8z2zY_Q&s=08 ) • [Portfolio](https://yugal-panchal.vercel.app/#experience)

---

> _Built with ❤️ using Flutter and GetX_
