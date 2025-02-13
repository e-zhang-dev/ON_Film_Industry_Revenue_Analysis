
WITH 
pass1 AS ( --pass1 cleaning extra spaces and misinputed text with ? -> -
    SELECT 
        Year, ---Int:
        trim(domestic_or_foreign) AS domestic_or_foreign, ---STR:
        REGEXP_REPLACE(type_of_production,"Mini?Series", "Mini-Series") AS type_of_production, ---STR:
        number_of_projects, ---INT:
        production_left_in_ontario ---INT:
    
    FROM ontario_film_and_tv_production_by_type_or_production_draft_june_2023
),
pass2 AS( ---pass2 cleaning misinputed text with ' ' -> -
    SELECT
        Year, ---INT:
        domestic_or_foreign, ---STR:
        REGEXP_REPLACE(type_of_production,"Mini Series", "Mini-Series") AS type_of_production, ---STR:
        number_of_projects, ---INT:
        production_left_in_ontario ---STR:
    FROM pass1
),
pass3 AS( --pass 3, cleaning up television spelling variation
    SELECT
        Year,---INT:
        domestic_or_foreign, ---STR:
        REGEXP_REPLACE(type_of_production,".*Televison", "Television") AS type_of_production, ---STR:
        number_of_projects, ---INT:
        production_left_in_ontario ---INT:
    FROM pass2
)


 SELECT * FROM pass3 ---final table
    ORDER BY Year