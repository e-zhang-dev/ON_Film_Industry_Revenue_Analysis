SELECT Year,   ---INT:
        type_of_production AS production_format,
        sum(production_left_in_ontario) AS , ---INT:
        cast(sum(production_left_in_ontario) / sum(number_of_projects) AS INT) AS ARPU, ---FLOAT -> INT: Average revenue per project,
        sum(number_of_projects) AS Project_Count ---INT:
   FROM clean_up_ontario_film_tv_data
   GROUP BY YEAR, production_format
   ORDER BY YEAR, production_format ASC