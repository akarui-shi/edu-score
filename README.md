### Проект "EduScore"

---

#### Описание

**EduScore** — это веб-приложение для управления оценками и статистикой школ. Приложение позволяет администраторам и пользователям взаимодействовать с базой данных школ, учеников и оценок.

---

#### Инструкция по развёртыванию/использованию

1. **Клонируйте репозиторий:**
   ```bash
   git clone <репозиторий>
   ```
   
2. **Перейдите в директорию проекта:**
   ```bash
   cd EduScore-master
   ```

3. **Соберите проект с помощью Maven:**
   ```bash
   ./mvnw clean install
   ```

4. **Запустите приложение:**
   ```bash
   ./mvnw spring-boot:run
   ```

5. **Откройте браузер и перейдите по адресу:**
   ```
   http://localhost:8080
   ```

---

#### Системные требования

- **Язык:** Java 11
- **Система сборки:** Maven
- **База данных:** H2 (встроенная)
- **Зависимости:**
  - Spring Boot
  - Spring Security
  - Spring Data JPA

---

#### Планы по доработке

- Добавление API для интеграции с другими сервисами.
- Улучшение пользовательского интерфейса.
- Поддержка нескольких языков.

---

#### Стек технологий

- **Java**
- **Spring Boot**
- **Maven**
- **H2 Database**
- **Freemarker** (для шаблонов)

---

#### Техническая документация

Подробная документация находится в директории `src/main/resources`.

---

#### Настройка CI

Для запуска Continuous Integration используйте GitHub Actions:

```yaml
name: Java CI

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Set up JDK 11
      uses: actions/setup-java@v2
      with:
        java-version: '11'
    - name: Build with Maven
      run: mvn clean install
```
