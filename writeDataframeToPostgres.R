library(RPostgreSQL)


# Open a tunnel in SSH in terminal
# Source the connection file
source("_connections/connections.R")

# Dataframe
col1 = c(1, 2, 3) 
col2 = c("aa", "bb", "cc") 
df = data.frame(col1, col2)

# Set the output parameters
output_schema <- "schema_name"
output_table <- "table_name"


# Write the table
dbWriteTable(conn,name=c(output_schema,output_table),row.names=FALSE,overwrite=TRUE)


# If you want to additional tasks, to them here with the function dbSendQuery
# CREATE INDEX
# ALTER TABLE
# 
dbDisconnect(conn)






