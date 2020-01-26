
#this_table = data.frame(first_name = c('Antoine', 'Yann'), last_name = c('Rosin', 'Vaillard'))
this_table = load_data(file_type = "all_players")

this_table <- reactiveVal(this_table)

observeEvent(input$add_btn, {
  t = rbind(data.frame(first_name = input$first_name,
                       last_name = input$last_name), 
            this_table())
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


output$results_1 <-
  renderPrint(
    input$rank_list_1 # This matches the input_id of the first rank list
  )
output$results_2 <-
  renderPrint(
    input$rank_list_2 # This matches the input_id of the second rank list
  )
output$results_3 <-
  renderPrint(
    input$bucket_list_group # Matches the group_name of the bucket list
  )