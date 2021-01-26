library(RPostgreSQL)


# Open a tunnel in SSH in terminal
# Source the connection file
source("_connections/connections.R")

# Dataframe
col1 = c(1, 2, 3,47.54758900000001, 7.590734883555875)
col2 = c("aa", "bb", "cc",lat,lon)
df = data.frame(col1, col2)

# Convert to SF

crs_in_file <- 4326

sf <- sf %>%
  st_as_sf(coords = c("lon", "lat"), crs = crs_in_file)%>%
  rename(geom=geometry)

# Set the output parameters
output_schema <- "schema_name"
output_table <- "table_name"

# Clear the table
rs<-dbSendQuery(conn,paste0("DROP TABLE IF EXISTS ",output_schema,".",output_table ))
dbClearResult(rs)

# I ran into issue with the connection here - I ended up using RPostgres instead of RPostgreSQL
st_write(obj = sf, dsn = connPostgreSQL, layer=c(output_schema,output_table),
         layer_options = c("OVERWRITE=yes"))

# I ran into the issue with the CRS not being written to the DB correctly

rs <- dbSendQuery(conn,paste0("UPDATE ",output_schema,".",output_table," SET geom = st_setsrid(geom,4326)" ))
dbClearResult(rs)

dbDisconnect(conn)






