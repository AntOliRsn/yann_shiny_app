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
            labels = list(
              "one",
              "two",
              "three"
            ),
            input_id = "rank_list_1"
          ),
          add_rank_list(
            text = "Game's players",
            labels = NULL,
            input_id = "rank_list_2"
          )
        )
      )
    )
  )
)
