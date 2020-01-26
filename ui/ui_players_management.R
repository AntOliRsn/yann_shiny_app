tabItem(tabName = "players_management", 
  fluidPage(
    fluidRow(
      box(title = "Manage players", width = 6, status = "primary",solidHeader = TRUE,
        splitLayout(
          textInput("first_name", label = "First name", value = "Yann"),
          textInput("last_name", label = "Last name", value = "Vaillard")
        ),
        actionButton("add_btn", "Add"),
        actionButton("delete_btn", "Delete")
      )
    ),
    fluidRow(
      box(title = "List of players", width = 6, status = "primary",solidHeader = TRUE,
        DT::dataTableOutput("shiny_table")
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