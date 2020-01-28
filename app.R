library(shiny)
library(shinydashboard)
library(sortable)
library(stringr)
library(dplyr)
library(DT)
library(zeallot)

# Load utils methofds
source('utils.R', local = TRUE)
source('ui/reactive_ui.R', local = TRUE)

# Creates the sidebar at the right of the app
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Players management", tabName = "players_management", icon = icon("map-o")),
    menuItem("Game management", tabName = "games_management", icon = icon("area-chart"))
    )
)

# Creates the main body of the app 
body <- dashboardBody(
#  useShinyjs(),
#  introjsUI(),
  includeCSS("css/style.css"),
#  tags$style(appCSS),
  tabItems(
    source("ui/ui_players_management.R",  local = TRUE)$value,
    source("ui/ui_game_management.R",  local = TRUE)$value
  )
)

# UI part 
ui <- shinyUI(
  dashboardPage(skin="blue",
                dashboardHeader(title = "Games management"),
                sidebar,
                body
  )
)

# Server part 
server <- function(input, output, session) {
  # Include the logic (server) for each tab
  source("server/server_main.R",  local = TRUE)$value
}

# Call of the app
shinyApp(ui = ui, server = server, options = list(display.mode = "showcase"))
