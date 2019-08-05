# records_per_second
runs a count(*) on a table every 1 second, and calculates the delta at each interval, effectively giving you a rough RPS in a single table.

NOTE: query execution has an overhead which makes the intervals a bit unpredictable.  You can track actual time delta with the client return time.

usage is `call records_per_second(tablename)` or call `records_per_second(dbname.tablename)`

```
memsql> call records_second("insight.seed_data");
+---------+-------+
| counter | RPS   |
+---------+-------+
|       1 | 42223 |
+---------+-------+
1 row in set (2.12 sec)

+---------+-------+
| counter | RPS   |
+---------+-------+
|       2 | 42222 |
+---------+-------+
1 row in set (3.16 sec)

+---------+-------+
| counter | RPS   |
+---------+-------+
|       3 | 38976 |
+---------+-------+
1 row in set (4.21 sec)

+---------+-------+
| counter | RPS   |
+---------+-------+
|       4 | 42220 |
+---------+-------+
1 row in set (5.27 sec)

...

...
```
