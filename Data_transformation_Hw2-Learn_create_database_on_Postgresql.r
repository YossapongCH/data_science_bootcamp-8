## connect to SQL server (postgresql)
library(RPostgreSQL)
library(tidyverse)

con <- dbConnect(PostgreSQL(),
                 host = "arjuna.db.elephantsql.com",
                 port = 5432,
                 user = "yclognvl",
                 password = "Ehtric4GmaG5jyo0xzRJbUKspZNYnRLj",
                 dbname = "yclognvl")
dbListTables(con)


pizza_menu <- data.frame(
  topping = c("hawaiian", "pepperoni", "veggie", "seafood", "meat trio")
)

size_and_price <- data.frame(
  size = c("small", "medium", "large"),
  price = c(200, 350, 500)
)

pizza_crust <- data.frame(
  crust_type = c("crispy thin crust", "pan", "deep dish", "sausage", "cheese"),
  additional_price = c(0, 0, 100, 150, 150)
)


dbWriteTable(con, "pizza_menu", pizza_menu, row.names=FALSE)
dbWriteTable(con, "size_and_price", size_and_price, row.names=FALSE)
dbWriteTable(con, "pizza_crust", pizza_crust, row.names=FALSE)

## get data
test <- dbGetQuery(con, "select *, price + additional_price AS total_price from pizza_menu cross join size_and_price cross join pizza_crust order by topping, size DESC, additional_price")


dbRemoveTable(con, "pizza_menu", "size_and_price", "pizza_crust")


dbDisconnect(con)
