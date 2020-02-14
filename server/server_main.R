
#this_table = data.frame(first_name = c('Antoine', 'Yann'), last_name = c('Rosin', 'Vaillard'))
this_table = load_data(file_type = "all_players")

this_table <- reactiveVal(this_table)

observeEvent(input$add_btn, {
  t = rbind(data.frame(first_name = str_to_title(input$first_name),
                       last_name = str_to_title(input$last_name), 
                       stringsAsFactors=FALSE), 
            this_table())
  t = t[!duplicated(t), ]

  this_table(t)
  save_data(t, file_type="all_players")
  
  removeUI(
    selector = "#reactive_div" 
  )
  insertUI(
    selector = "#container_div",
    where = "afterEnd",
    ui = return_drag_and_drop_list_ui()
  )
})

observeEvent(input$delete_btn, {
  t = this_table()
  
  if (!is.null(input$shiny_table_rows_selected)) {
    
    removed_lines = as.numeric(input$shiny_table_rows_selected)
    removed_players_df = t[removed_lines, ]
    
    t <- t[-removed_lines,]
    this_table(t)
    save_data(t, file_type="all_players")
    
    remove_player_from_game(removed_players_df)
    
    removeUI(
      selector = "#reactive_div" 
    )
    insertUI(
      selector = "#container_div",
      where = "afterEnd",
      ui = return_drag_and_drop_list_ui()
    )
  }
})

output$download_data_btn <- downloadHandler(
  filename = function() {
    paste("players_list", ".csv", sep = "")
  },
  content = function(file) {
    write.csv(this_table(), file, row.names = TRUE)
  }
)

output$shiny_table <- renderDT({
  datatable(this_table(), options = list(columnDefs = list(list(className = 'dt-center', targets = 0:2))))
})

observeEvent(input$rank_list_2, {
  game_players_list = as.list(input$rank_list_2)
  save_data(list_to_data(game_players_list), file_type = "game_players")
})


observeEvent(input$rmv, {
  
  empty_game_players_list()
  removeUI(
    selector = "#reactive_div", 
    #selector = "div:has(> #reactive_div)", 
  )
  insertUI(
    selector = "#container_div",
    where = "afterEnd",
    ui = return_drag_and_drop_list_ui()
  )
})