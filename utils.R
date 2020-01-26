fileName <<- "players_list.rds"

save_data = function(data) {
  file_path = file.path("./data", fileName)
  saveRDS(data, file=file_path)
}


load_data = function() {
  file_path = file.path("./data", fileName)
  data = readRDS(file=file_path)
  return(data)
}
