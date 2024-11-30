#создать пользователя
db.createUser(
  {
    user: "manager",
    pwd: "1234",
    roles: [ { role: "read", db: "manager_db" } ]
  }
)

use manager_db

#создание таблицы
db.createCollection("data"); 