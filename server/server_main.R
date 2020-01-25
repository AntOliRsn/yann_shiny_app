
this_table = data.frame(first_name = c('Antoine', 'Yann'), last_name = c('Rosin', 'Vaillard'))


this_table <- reactiveVal(this_table)

observeEvent(input$add_btn, {
  t = rbind(data.frame(first_name = input$first_name,
                       last_name = input$last_name), 
            this_table())
  this_table(t)
})

observeEvent(input$delete_btn, {
  t = this_table()
  print(nrow(t))
  if (!is.null(input$shiny_table_rows_selected)) {
    t <- t[-as.numeric(input$shiny_table_rows_selected),]
  }
  this_table(t)
})

output$shiny_table <- renderDT({
  datatable(this_table(), 
            options = list(columnDefs = list(list(className = 'dt-center', targets = 0:2)))
  )
})
