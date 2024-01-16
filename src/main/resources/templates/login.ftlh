
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduScore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        .header {
            background-color: rgba(237, 239, 246, 1);
            width: 100%;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
        }

        .header h1 {
            color: rgba(30, 38, 64, 1);
            font-family: 'Inter';
            font-size: 40px;
            letter-spacing: 0;
            line-height: 48px;
        }

        .login-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin-top: -50px;
            overflow: hidden;
        }

        .login-form {
            width: 450px;
            padding: 40px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 30px;
        }

        label {
            font-size: 20px;
            margin-bottom: 15px;
            display: block;
        }

        input {
            width: 100%;
            padding: 18px;
            font-size: 18px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .login-button, .register-link {
            width: 100%;
            text-align: center; /* Центрируем текст кнопок */
        }

        .login-button {
            background-color: rgba(74, 96, 161, 1);
            color: white;
            padding: 18px 40px;
            font-size: 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-bottom: 10px; /* Добавлен отступ между кнопками */
        }

        .login-button:hover {
            background-color: #4a5ca1;
        }

        .register-link {
            font-size: 16px;
            color: #4a5ca1;
            text-decoration: none;
            display: block; /* Чтобы занимала всю ширину родительского блока */
        }

        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>EduScore</h1>
</div>
<div class="login-container">
    <form class="login-form" action="/login" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="username" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="login-button">Войти</button>
        <a href="/registration" class="register-link">Зарегистрироваться</a>
    </form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
