SET SQL_MODE = "PIPES_AS_CONCAT";

-- watch number of rows being inserted per second into a table
-- input variable is database / tablename to watch

delimiter // 
create or replace procedure records_per_second(tablename varchar(128)) as 
declare value1 integer;
        value2 integer;
        q_string text = 'select count(*) from ' || tablename;
        q query(i integer) = to_query(q_string);
        t int;
        c int = 1;         
begin
        while true loop
                value1 = scalar(q);
                t = sleep(1);
                value2 = scalar(q);
                echo select c as counter, value2-value1 as "RPS";
                c +=1;
	end loop;
end //
delimiter ;
                
