# todo-list-api

## getting started

```
$ docker-compose up --build
# access to localhost:3000
```

## 認証

[devise-token-auth](https://github.com/lynndylanhurley/devise_token_auth) を利用しています  


### 新規登録
```
POST /v1/users/auth/

Request
{
  "email":"example@example.com",
  "password":"password",
  "password_confirmation": "password"
}

Response
{
   "status":"success",
   "data":{
      "uid":"example@example.com",
      "id":1,
      "email":"example@example.com",
      "provider":"email",
      "allow_password_change":false,
      "name":null,
      "nickname":null,
      "image":null,
      "created_at":"2020-04-16T02:58:40.765Z",
      "updated_at":"2020-04-16T02:58:40.889Z"
   }
}
```

### サインイン
```
POST /v1/users/auth/sign_in

Request
{
  "email":"example@example.com",
  "password":"password"
}

ResponseHeader
"access-token": "G1Fcytw8FkhlYhMWRypBjA"
"token-type": "Bearer"
"client": "CIX_z6sBzKghvoh4ZhiV5A"
"expiry": "1588234471"
"uid": "example@example.com"

ResponseBody
{
  "data": {
    "id": 1,
    "email": "example@example.com",
    "provider": "email",
    "uid": "example@example.com",
    "allow_password_change": false,
    "name": null,
    "nickname": null,
    "image": null
  }
}
```

レスポンスヘッダにあるaccess-token, token-type, client, uidを各エンドポイントのリクエストヘッダに追加することで認証できる。

### 認証の確認

適当なエンドポイントを叩く

```
GET /v1/todos

RequestHeader
"access-token": "G1Fcytw8FkhlYhMWRypBjA"
"client": "CIX_z6sBzKghvoh4ZhiV5A"
"uid": "example@example.com"

ResponseBody
[]
```