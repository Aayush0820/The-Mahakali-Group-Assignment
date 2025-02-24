
---

# Flutter Project

This Flutter project demonstrates responsive UI design and state management using Riverpod. It leverages platform checks to adjust container sizes and utilizes widgets such as **Wrap** and **Card** for layout management.

## Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone [<repository-url>](https://github.com/Aayush0820/The-Mahakali-Group-Assignment.git)
   cd <repository-directory>
   ```

2. **Install Dependencies**

   Run the following command to fetch all required packages:

   ```bash
   flutter pub get
   ```

3. **Run the Project Locally**

    - **For Mobile (Android/iOS):**

      Ensure you have an emulator running or a device connected, then run:

      ```bash
      flutter run
      ```

    - **For Web:**

      Run the project in your browser with:

      ```bash
      flutter run -d chrome
      ```

## Approach Taken

- **Project Structure:**  
  The code is organized into logical modules, separating UI components, business logic, and state management to keep the project scalable and maintainable.

- **Responsiveness:**  
  The UI adapts to different screen sizes using platform checks. For example, container sizes change based on whether the app is running on web or mobile. Widgets like **Wrap** and **Card** are used to create flexible layouts that automatically adjust to the available screen space.

- **State Management:**  
  Riverpod is used to manage application state. This choice simplifies state handling and debugging while promoting a clear separation of concerns within the codebase.

## Challenges Faced & Solutions

- **Learning Riverpod State Management:**  
  The initial challenge was understanding and effectively implementing Riverpod. I overcame this by studying documentation, following tutorials, and seeking help from the community through StackOverflow and GitHub discussions.

- **Viewport and RenderBox Errors:**  
  I encountered viewport and RenderBox errors during development. Analyzing the error messages helped me identify layout issues. Adjusting widget constraints and reviewing the widget tree resolved these errors.

- **Community Support:**  
  Assistance from StackOverflow and GitHub chats played a significant role in troubleshooting and learning best practices. The shared experiences and solutions from other developers were invaluable in overcoming these challenges.

## Conclusion

This project showcases a practical implementation of responsive design in Flutter alongside robust state management using Riverpod. The experience has provided a deeper understanding of Flutter's layout system and advanced state management techniques.

---
