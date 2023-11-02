----- Start MySQL server

theia@theiadocker-brownononiwu:/home/project$ start_mysql
Starting your MySQL database....
This process can take up to a minute.
      
MySQL database started, waiting for all services to be ready....
    
Your MySQL database is now ready to use and available with username: root password: MzE2OTAtYnJvd25v

You can access your MySQL database via:
 • The browser at: https://brownononiwu-8080.theiadocker-2-labs-prod-theiak8s-4-tor01.proxy.cognitiveclass.ai
 • CommandLine: mysql --host=127.0.0.1 --port=3306 --user=root --password=MzE2OTAtYnJvd25v
theia@theiadocker-brownononiwu:/home/project$ mysql -u your_username -pEnter password: 
ERROR 1045 (28000): Access denied for user 'your_username'@'172.18.0.1' (using password: YES)
theia@theiadocker-brownononiwu:/home/project$ MzE2OTAtYnJvd25v
bash: MzE2OTAtYnJvd25v: command not found
theia@theiadocker-brownononiwu:/home/project$ mysql --host=127.0.0.1 --port=3306 --user=root --password=MzE2OTAtYnJvd25v
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 33
Server version: 8.0.22 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

------Create a database named sales

mysql> create Database sales;
Query OK, 1 row affected (0.01 sec)

------Create the sales_data table in sales database

mysql> CREATE TABLE sales.sales_data(
    -> product_id INT NOT NULL PRIMARY KEY,
    -> customer_id INT NOT NULL,
    -> price DECIMAL(10,2) NOT NULL,
    -> quantity INT NOT NULL,
    -> timestamp DATE NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

--------List the tables in the database sales

mysql> SHOW TABLES FROM sales;
+-----------------+
| Tables_in_sales |
+-----------------+
| sales_data      |
+-----------------+
1 row in set (0.00 sec)

------Write a query to find out the count of records in the tables sales_data.

mysql> SELECT COUNT(*) FROM sales.sales_data;
+----------+
| COUNT(*) |
+----------+
|      706 |
+----------+
1 row in set (0.00 sec)

-----Create an index named sales_timestamp on the timestamp field and show it.

mysql> CREATE INDEX sales_timestamp ON sales.sales_data(timestamp);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW INDEX FROM sales.sales_data;
+------------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name        | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| sales_data |          0 | PRIMARY         |            1 | product_id  | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| sales_data |          1 | sales_timestamp |            1 | timestamp   | A         |           1 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.00 sec)

---------Write a bash script to export data


mysql> exit
Bye
theia@theiadocker-brownononiwu:/home/project$ chmod +x datadump.sh
theia@theiadocker-brownononiwu:/home/project$ ./datadump.sh
mysqldump: [Warning] Using a password on the command line interface can be insecure.
Data exported successfully to sales_data.sql.
theia@theiadocker-brownononiwu:/home/project$ ls
datadump.sh  sales_data.sql
theia@theiadocker-brownononiwu:/home/project$ 