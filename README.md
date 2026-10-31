# AndPY — Mobile Code Studio

AndPY là ứng dụng Android dạng IDE gọn nhẹ. Bản 1.0 tập trung vào soạn thảo mã nguồn offline và xuất tệp/dự án.

## Ngôn ngữ có sẵn

- Python (`.py`)
- C++ (`.cpp`)
- C# (`.cs`)
- Java (`.java`)
- HTML (`.html`)
- JavaScript (`.js`)
- CSS (`.css`)

## Chức năng hiện có

- Tạo workspace theo ngôn ngữ và mẫu code khởi đầu.
- Soạn thảo nhiều tệp trong một dự án.
- Tự lưu workspace trong bộ nhớ riêng của ứng dụng.
- Lưu tệp riêng qua hộp thoại lưu của Android.
- Xuất toàn bộ dự án thành ZIP.
- Xem trước tệp HTML.
- Giao diện tối, tối ưu cho màn hình điện thoại.

## Tạo APK mà không cài Android Studio (khuyên dùng)

Dự án đã có GitHub Actions để GitHub tự build APK trên máy chủ.

1. Đăng nhập GitHub và tạo một repository mới, ví dụ `AndPY`.
2. Giải nén file ZIP này trên máy tính.
3. Mở repository mới → **Add file → Upload files**.
4. Kéo toàn bộ nội dung bên trong thư mục `AndPY` (bao gồm cả thư mục ẩn `.github`) vào trang upload rồi chọn **Commit changes**. Nếu trình duyệt không nhận thư mục `.github`, hãy tạo thư mục và tệp `.github/workflows/build-apk.yml` bằng giao diện GitHub, rồi dán nội dung file đó từ dự án.
5. Mở tab **Actions** của repository.
6. Chọn workflow **Build AndPY APK** → **Run workflow** (hoặc đợi workflow tự chạy sau lần commit).
7. Khi workflow có dấu xanh, mở lần chạy đó và tải artifact **AndPY-debug-APK** trong mục **Artifacts**.
8. Giải nén artifact để lấy `app-debug.apk`, rồi chuyển APK sang điện thoại và cài đặt. Android có thể hỏi xác nhận cho phép cài ứng dụng từ nguồn bạn vừa dùng.

Bạn chỉ cần trình duyệt để gửi mã nguồn và tải APK; GitHub thực hiện phần build. Không cần cài Android Studio trên máy. GitHub có thể yêu cầu tài khoản và áp dụng giới hạn phút chạy Actions theo loại tài khoản/repository.

## Build APK trực tiếp trên máy (tùy chọn)

Nếu không dùng GitHub Actions, có thể build bằng terminal trong VS Code, nhưng vẫn cần JDK 17+, Android SDK và Gradle 8.9. Android Studio là cách cài SDK thuận tiện, không bắt buộc phải dùng IDE đó để viết code.

Trên Windows, mở terminal tại thư mục gốc dự án rồi chạy:

```bat
gradlew.bat assembleDebug
```

APK debug sẽ nằm tại:

`app\build\outputs\apk\debug\app-debug.apk`

## Giới hạn cần biết

AndPY 1.0 hiện là trình soạn thảo và quản lý mã nguồn. Ứng dụng **chưa chạy/biên dịch trực tiếp** Python, C++, C#, Java và chưa có trình đóng gói dự án thành APK ngay bên trong app. Muốn biên dịch từng ngôn ngữ cần tích hợp runtime/compiler tương ứng; muốn tạo APK cần Android SDK, Gradle và cấu hình dự án Android.

## Cấu trúc chính

```text
AndPY/
├── .github/workflows/build-apk.yml  # Tự build APK trên GitHub
├── app/
│   └── src/main/
│       ├── assets/index.html
│       ├── java/com/andpy/app/
│       ├── res/
│       └── AndroidManifest.xml
├── build.gradle
├── settings.gradle
├── gradle.properties
└── gradlew / gradlew.bat
```
