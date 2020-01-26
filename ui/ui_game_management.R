tabItem(tabName = "games_management", 
  fluidPage(
    fluidRow(
      box(title = "Test", width = 12, status = "primary",solidHeader = TRUE,
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
  )
)

