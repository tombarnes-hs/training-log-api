# Training Log

This app is a tool for rowers to maintain a record of their workouts. Once signed in, users can view their workout log, which will show a record of every workout they've recorded, add new workouts to the log, edit notes about their workouts, and delete workouts.

The client repo can be found [here](https://github.com/TomG84/training-log-client).


* The deployed Training Log API can be found [here](https://frozen-sierra-35636.herokuapp.com/).
* The deployed Training Log App can be found [here](https://tomg84.github.io/training-log-client/).

## Traing Log API

Find below the documentation for using this API. The Authentication resource will be followed by the Workouts resource.

Scripts are included in [`curl-scripts`](curl-scripts) to test built-in actions. You can test user authentication and CRUD to the workouts resource.

[Entity Relationship Diagram](https://imgur.com/LCANsXZ "User - Workouts Relationship Diagram")

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

### Workouts

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| POST | `/workouts`| `workouts#create`    |
| GET  | `/workouts` | `workouts#index`  |
| DELETE  | `/workouts/1`  | `workouts#destroy`      |
| PATCH| `/workouts/1`  | `workouts#update`    |

#### POST /workouts

Request:

```sh
curl 'http://localhost:4741/workouts' \
  --include \
  --request POST \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "workout": {
      "date": "'"${DATE}"'",
      "elapsed_time": "'"${TIME}"'",
      "average_watts": "'"${WATTS}"'",
      "average_hr": "'"${HR}"'",
      "pre_fatigue": "'"${PRE_FATIGUE}"'",
      "post_fatigue": "'"${POST_FATIGUE}"'",
      "notes": "'"${NOTES}"'"
    }
  }'
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f DATE=1/1/1900 ELAPSED_TIME=60 sh curl-scripts/workouts/create.sh
```

Response:

```md
HTTP/1.1 201 OK
Content-Type: application/json; charset=utf-8

{
  "workout":
   {
      "id":13,
      "date":"1900-01-01",
      "elapsed_time":60,
      "average_watts":null,
      "average_hr":null,
      "pre_fatigue":null,
      "post_fatigue":null,
      "notes":"",
      "user":
      {
        "id":2,
        "email":"",
        "token":"",
        "password_digest":"",
        "created_at":"2018-10-23T15:04:40.925Z",
        "updated_at":"2018-10-24T00:55:08.121Z"
      }
   }
}
```

#### GET /workouts

Request:

```sh
curl 'http://localhost:4741/workouts' \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f sh curl-scripts/workouts/index.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "workouts":
    [
      {
        "id":5,
        "date":"2018-10-31",
        "elapsed_time":30,
        "average_watts":260,
        "average_hr":145,
        "pre_fatigue":3,
        "post_fatigue":5,
        "notes":"Good steady-state workout",
        "user":
          {
            "id":2,
            "email":"",
            "token":"",
            "password_digest":"",
            "created_at":"",
            "updated_at":""
          }
      }
   ]
}
```

#### DELETE /workouts/:id

Request:

```sh
curl "http://localhost:4741/workouts/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}" \
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f sh curl-scripts/workouts/destroy.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### PATCH /workouts/:id

Request:

```sh
curl "http://localhost:4741/workouts/${ID}" \
--include \
--request PATCH \
--header "Authorization: Token token=${TOKEN}" \
--header "Content-Type: application/json" \
  --data '{
    "workout": {
      "notes": "'"${NOTES}"'"
    }
  }'
```

```sh
ID=1 TOKEN=BAhJIiU1NGNlYjRmMjBhM2NkZTZiNzk1MGNiYmZiYWMyY2U4MwY6BkVG--ddb1e16af0e05921aa56d771e4a2f816f2a1d46e
NOTES=text sh curl-scripts/workouts/destroy.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "workout":
    {
      "id":5,
      "date":"2018-10-31",
      "elapsed_time":30,
      "average_watts":260,
      "average_hr":145,
      "pre_fatigue":3,
      "post_fatigue":5,
      "notes":"test",
      "user":
        {
          "id":2,
          "email":"",
          "token":"",
          "password_digest":"",
          "created_at":"2018-10-23T15:04:40.925Z",
          "updated_at":"2018-10-24T00:55:08.121Z"
        }
    }
}
