tabItem(tabName = "players_management",
        fluidPage(
          div(class = "	.col-xs-12 col-sm-12 col-md-6",
              fluidRow(
                box(
                  title = "Manage players",
                  width = 12,
                  status = "primary",
                  solidHeader = TRUE,
                  fluidRow(column(12,
                                  splitLayout(
                                    textInput("first_name", label = "First name", value = "Yann"),
                                    textInput("last_name", label = "Last name", value = "Vaillard")
                                  ))),
                  fluidRow(
                    column(
                      3,
                      actionButton("add_btn", "Add",
                                   icon("user-plus"),
                                   style = "color: #fff; background-color: #4CAF50; border-color: #4CAF50; padding-right:10px; padding-left:10px; width: 100%;")
                    ),
                    column(
                      3,
                      actionButton("delete_btn", "Delete",
                                   icon("user-minus"),
                                   style = "color: #fff; background-color: #EE5534; border-color: #EE5534; padding-right:10px; padding-left:10px; width: 100%;")
                    ),
                    column(
                      3,
                      offset = 3,
                      downloadButton("download_data_btn", "Download",
                                     style = "width: 100%")
                    )
                  )
                )
              ),
              fluidRow(
                box(
                  title = "List of players",
                  width = 12,
                  status = "primary",
                  solidHeader = TRUE,
                  DT::dataTableOutput("shiny_table")
                )
              ))
        ))