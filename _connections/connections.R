
drv <- dbDriver("PostgreSQL")

conn <- dbConnect(drv, dbname="db_name",host="localhost",port=5432,user="user",password="password" )

# Handy function to kill connections
kill_db_connections <- function (x) {
  
  all_cons <- dbListConnections(PostgreSQL())
  
  print(all_cons)
  
  for(con in all_cons)
  {
    dbDisconnect(con)
  }
  print(paste(length(all_cons), " connections killed."))
  
}


