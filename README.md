# 🖥️ FileMan

**FileMan** is a lightweight, cross-platform graphical file explorer built with the **Nim** programming language and the **NiGui** toolkit. It focuses on simplicity, speed, and providing a clean GUI for basic file system navigation.

![Nim](https://img.shields.io/badge/Language-Nim-FFE953?style=for-the-badge&logo=nim&logoColor=white)
![GUI](https://img.shields.io/badge/Toolkit-NiGui-00AD11?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)

## ✨ Features

* **Native GUI Interface:** A clean window-based experience powered by NiGui.
* **Folder Navigation:** Open folders and explore subdirectories with ease.
* **Path Tracking:** Real-time display of the current directory path.
* **Quick Back:** Built-in "Go Back" logic to return to parent directories instantly.
* **File Listing:** Automatically identifies and lists files and folders in the current view.

## 📂 Project Structure

The project is organized into modular components for better maintainability:

* `src/ui.nim` – The main entry point. Handles window creation, layout management, and user interactions.
* `src/fmlogic.nim` – The engine of the app. Responsible for scanning directories and fetching file metadata.
* `src/appstatefile.nim` – Manages the global state of the application, including the current path history.
* `fileman.nimble` – Package configuration and dependency list.

## 🚀 Getting Started

### Prerequisites

To compile and run FileMan, you need:
1.  The [Nim Compiler](https://nim-lang.org/install.html) installed.
2.  **NiGui** library. Install it via nimble:
    ```bash
    nimble install nigui
    ```

### Installation & Execution

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/Denis-ctr/FileMan.git](https://github.com/Denis-ctr/FileMan.git)
    cd FileMan
    ```

2.  **Run the application:**
    ```bash
    nimble run
    ```
    *Or compile manually:*
    ```bash
    nim c -r --app:gui src/ui.nim
    ```

## 🛠️ Planned Improvements

- [ ] File search and filtering.
- [ ] Ability to rename and delete files.
- [ ] Icons for different file types.

## 📄 License

This project is licensed under the MIT License. Feel free to use and modify it!

---
Developed with 👑 by [Denis-ctr](https://github.com/Denis-ctr)
