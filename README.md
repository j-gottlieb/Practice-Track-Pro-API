## Summary
The Practice Track Pro API is designed to store data associated with the [Practice
Track Pro](https://j-gottlieb.github.io/Practice-Track-Pro-Client/) app. It has
three tables which are all CRUD-able. Those tables can be viewed in the linked
ERD diagram.

This API can be reached by any client, but is designed to communicate with the
Practie Track Pro client. The client repo can be found [here.](https://github.com/j-gottlieb/Practice-Track-Pro-Client)

## Links
[ERD](https://github.com/j-gottlieb/Practice-Track-Pro-Client/blob/master/public/images/ERD.jpg)
[API Repo](https://github.com/j-gottlieb/Practice-Track-Pro-API)
[Client Repo](https://github.com/j-gottlieb/Practice-Track-Pro-Client)


### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password`     | `users#changepw`  |
| DELETE | `/sign-out`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
OLDPW='hannah' NEWPW='elle' TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh curl-scripts/auth/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out

Request:

```sh
curl http://localhost:4741/sign-out \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh curl-scripts/auth/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Practices/Goals
The practice and goal resources both follow standard CRUD actions. The practice
resource is outlined below, with goal following the same pattern.

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/practices`             | `users#create`  |
| GET   | `/practices`             | `users#index`    |
| GET   | `/practices/:id`         | `users#show`    |
| PATCH  | `/practices/:id`     | `users#update`  |
| DELETE | `/practices/:id`        | `users#destroy`   |

#### POST /sign-up

Request:

```sh
curl "http://localhost:4741/practices" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "practice": {
      "duration": "'"${DURATION}"'",
      "date": "'"${DATE}"'"
    }
  }'
```

```sh
DATE='2018/10/23' DURATION=30 sh curl-scripts/practices/create-practice.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "practice": {
    "id": 1,
    "Date": "2018/10/23",
    "Duration": 30
  }
}
```

#### GET /practices

Request:

```sh
curl "https://practice-track-pro.herokuapp.com/practices" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f sh curl-scripts/practices/index-practice.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

[{},{},{}]
```

#### GET /practices/:id

Request:

```sh
curl "https://practice-track-pro.herokuapp.com/practices/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \
  '{
    "practice": {
      "id": "'${ID}'"
    }
  }'
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f ID=1 sh curl-scripts/practices/index-practice.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "practice": {
    "id": 1,
    "Date": "2018/10/23",
    "Duration": 30
  }
}

```

####  PATCH /practices/:id

Request:

```sh
curl "https://practice-track-pro.herokuapp.com/practices/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "practice": {
      "duration": "'"${DURATION}"'",
      "date": "'"${DATE}"'"
    }
  }'
```

```sh
ID=1 DATE="2018/10/23" DURATION=30 TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh curl-scripts/practices/update-practice.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "practice": {
    "id": 1,
    "Date": "2018/10/23",
    "Duration": 30
  }
}


#### DELETE /practices/:id

Request:

```sh
curl "http://practice-track-pro.herokuapp.com/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "practice": {
      "id": "'${ID}'"
    }
  }'
```

```sh
ID=1 TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh curl-scripts/practices/destroy-practice.sh
```

Response:

```md
HTTP/1.1 204 No Content
