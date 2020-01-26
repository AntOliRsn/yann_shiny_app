tabItem(tabName = "games_management", 
  fluidPage(
    fluidRow(
      column(
        tags$b("Exercise"),
        width = 12,
        bucket_list(
          header = "Drag the items in any desired bucket",
          group_name = "bucket_list_group",
          orientation = "horizontal",
          add_rank_list(
            text = "List of players",
            labels = data_to_list(load_data(file_type = "all_players")),
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
  )
)
