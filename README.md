# COMMAND

rake wh:make_table  => drop if exist and create tables in psql database

rake wh:populate:* => populate psql tables with data from mysql database 

* = quote, elevator, contact, customer, intervention

rake wh:reset => Does all the previous rake command in order

rake final:setup  => does rake db:reset and rake final:setup


# Week8
## Fact_Intervention
https://github.com/khedayati/Rocket_Elevators_API/blob/master/lib/tasks/data_warehouse.rake
The rake file named data_warehouse.rake does the creation of the fact_intervention from line 141 to 156.
It is integrated into the rake wh:make_table command.

## Fake Data for fact_intervention
https://github.com/khedayati/Rocket_Elevators_API/blob/master/lib/tasks/data_warehouse.rake
Also made found in data_warehouse.rake under the namespace wh:populate in the task intervention from line 209 to 270.
It is intergrated in the rake final:setup as is the wh:make_table.
### Where to see the data
They can be seen on the database named LEVY_POSTGRES in the postgres server we have been using

