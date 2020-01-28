
#this_table = data.frame(first_name = c('Antoine', 'Yann'), last_name = c('Rosin', 'Vaillard'))
this_table = load_data(file_type = "all_players")

this_table <- reactiveVal(this_table)

observeEvent(input$add_btn, {
  t = rbind(data.frame(first_name = str_to_title(input$first_name),
                       last_name = str_to_title(input$last_name)), 
            this_table())
  t = t[!duplicated(t), ]

  this_table(t)
  save_data(t, file_type="all_players")
})

observeEvent(input$delete_btn, {
  t = this_table()
  if (!is.null(input$shiny_table_rows_selected)) {
    t <- t[-as.numeric(input$shiny_table_rows_selected),]
  }
  this_table(t)
  save_data(t, file_type="all_players")
})

output$shiny_table <- renderDT({
  datatable(this_table(), options = list(columnDefs = list(list(className = 'dt-center', targets = 0:2))))
})

observeEvent(input$rank_list_2, {
  game_players_list = as.list(input$rank_list_2)
  save_data(list_to_data(game_players_list), file_type = "game_players")
})



observeEvent(input$rmv, {
  removeUI(
    selector = "#reactive_div", 
    #selector = "div:has(> #reactive_div)", 
  )
  insertUI(
    selector = "#container_div",
    where = "afterEnd",
    ui = tags$div(id="reactive_div", 
                  bucket_list(
                    header = NULL,
                    group_name = "bucket_list_group",
                    orientation = "horizontal",
                    add_rank_list(
                      text = "List of players",
                      labels = data_to_list(get_diff_df(load_data(file_type = "all_players"), load_data(file_type="game_players"))),
                      input_id = "rank_list_1"
                    ),
                    add_rank_list(
                      text = "Game's players",
                      labels = data_to_list(load_data(file_type = "game_players")),
                      input_id = "rank_list_2"
                    )
                  )
    )
  )
})