SELECT Year,   ---INT:
        domestic_or_foreign AS origin,
        type_of_production AS production_format,
        sum(production_left_in_ontario) AS Revenue, ---INT:
        cast(sum(production_left_in_ontario) / sum(number_of_projects) AS INT) AS ARPU, ---FLOAT -> INT: Average revenue per project,
        sum(number_of_projects) AS Project_Count ---INT:
   FROM clean_up_ontario_film_tv_data
   GROUP BY YEAR, origin, production_format
   ORDER BY YEAR, origin ASC