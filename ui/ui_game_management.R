tabItem(tabName = "games_management", 
  fluidPage(
    div(class = "	.col-xs-12 col-sm-12 col-md-8",
      fluidRow(
        box(width=4,
          actionButton("rmv", "Reset", icon("redo"), 
                       style="color: #fff; background-color: #EE5534; border-color: #EE5534; padding-right:30px; padding-left:30px; width: 100%"), 
          #tags$style(type='text/css', "#button { vertical-align- middle; height- 50px; width- 100%; font-size- 30px;}")
        )
      ),
      fluidRow(
        box(title = "Manage game players", width = 12, status = "primary",solidHeader = TRUE,
            tags$div(id = "container_div",
                     return_drag_and_drop_list_ui()
            )
        )
      )
    )
  )
)

