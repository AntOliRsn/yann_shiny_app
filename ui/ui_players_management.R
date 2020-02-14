tabItem(tabName = "players_management", 
  fluidPage(
    div(class = "	.col-xs-12 col-sm-12 col-md-6",
      fluidRow(
        box(title = "Manage players", width = 12, status = "primary",solidHeader = TRUE,
          splitLayout(
            textInput("first_name", label = "First name", value = "Yann"),
            textInput("last_name", label = "Last name", value = "Vaillard")
          ),
          actionButton("add_btn", "Add", 
                       icon("user-plus"),
                       style = "color: #fff; background-color: #4CAF50; border-color: #4CAF50; padding-right:10px; padding-left:10px; width: 150px"),
          actionButton("delete_btn", "Delete",
                       icon("user-minus"),
                       style = "color: #fff; background-color: #EE5534; border-color: #EE5534; padding-right:10px; padding-left:10px; width: 150px;")
        )
      ),
      fluidRow(
        box(title = "List of players", width = 12, status = "primary",solidHeader = TRUE,
          DT::dataTableOutput("shiny_table")
        )
      )
    )
  )
)

  
#   
#   sidebarLayout(
#     sidebarPanel(
#       sliderInput("bins",
#                   "Number of bins:",
#                   min = 1,
#                   max = 50,
#                   value = 30),
#       checkboxInput("cb", "T/F"),
#       actionButton("add_btn", "Add"),
#       actionButton("delete_btn", "Delete")
#     ),
#     
#     mainPanel(
#       DTOutput("shiny_table")
#     )
#   )
# )