# COMMAND

rake wh:make_table  => drop if exist and create tables in psql database

rake wh:populate:* => populate psql tables with data from mysql database 

* = quote, elevator, contact, customer

rake wh:reset => Does all the previous rake command in order

rake final:setup  => does rake db:reset and rake final:setup
