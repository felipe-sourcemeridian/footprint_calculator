# huella-carbono
http://35.192.174.91:3000/
INSTALL NODE
INSTALL MYSQL
load the dump in a database huella_carbono
install node dependencies: npm install
run the project: npm start

Con tu estilo de vida emites 7.58 TONELADAS DE CO2 (tCO2eq) al año!

formulas:

# of items x watts x .001 kW x hrs used x 0.354224 kg CO2e = kg CO2e
watt day kWh day
x miles x 0.40935 kg CO2e x 1 month x 1 week = kg CO2e
month mile 4 weeks 7 days day
 Frente a ello un árbol puede consumir desde 5 hasta 90 kilos de CO2, según sea su especie, edad o localización.
 
 .bash_profile:
export NODE_HOME=/usr/local/node
export PATH=$NODE_HOME/bin:$PATH


mysqld]
port = 3306
bind-address = 0.0.0.0
3) mysql

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'developer' WITH GRANT OPTION;
 FLUSH PRIVILEGES;

GRANT ALL ON huella_carbono.* TO bar@'202.54.10.20' IDENTIFIED BY 'PASSWORD';
FLUSH PRIVILEGES;


sudo service mysqld restart

 netstat -an | grep 3306
 
 http://35.192.174.91:3000/
 netstat -napt | grep
 
netcat -vv -l 0.0.0.0 3306
telnet localhost 3306


 ******************************QUERIES***************************************
mysql -u root -p -e "use huella_carbono; select * from viaje;

use huella_carbono;

/*Consulta historia GRAFICO BARRAS*/
SELECT sum(kg_co2), fecha FROM consumo
where cod_usuario= 1000
and fecha <= '2017-11-15'
GROUP BY fecha
order by fecha;

SELECT sum(kg_co2), fecha FROM viaje
where cod_usuario=1000 
and fecha <= '2017-11-15'
GROUP BY fecha
order by fecha;


/*Consulta grafico ciudades GRAFICO BURBUJAS*/
select nombre, emisionPromedio,pais,poblacion,area from ciudad;


/*Consultar grafico año Co2    GRAFICO TORTA*/
SELECT sum(kg_co2) FROM viaje
where fecha>'2016-12-31' and fecha<'2018-01-01' and cod_usuario=1000
union
SELECT sum(kg_co2) FROM consumo
where fecha>'2016-12-31' and fecha<'2018-01-01' and cod_usuario=1000;




select num_recomendacion, cod_usuario,estado, fecha,descripcion,tipo,consumo_kg_co2
from recomendacion inner join asignacion
on num = num_recomendacion
where cod_usuario = 1007 and fecha= '2017-11-15'
order by tipo, consumo_kg_co2;

SELECT (SELECT SUM(kg_co2) FROM viaje where cod_usuario=1000) + (SELECT SUM(kg_co2) FROM consumo where cod_usuario=1000) as total_kg;

select * from recomendacion where tipo="consumo" and consumo_kg_co2<=(SELECT sum(kg_co2) FROM consumo where cod_usuario=1000 and fecha = '2017-11-15');

select * from recomendacion where tipo="viaje" and consumo_kg_co2<=(SELECT sum(kg_co2) FROM viaje where cod_usuario=1000 and fecha = '2017-11-15');



select * from recomendacion where tipo="consumo" and consumo_kg_co2<=(SELECT sum(kg_co2) FROM consumo where cod_usuario=1000 and fecha = "2017-11-15")



SELECT * FROM huella_carbono.ciudad;
SELECT * FROM huella_carbono.usuario;



SELECT * FROM huella_carbono.electrodomestico;
SELECT * FROM huella_carbono.consumo;
SELECT * FROM huella_carbono.consumo
where cod_usuario in (1007,1000);


SELECT * FROM huella_carbono.transporte;
SELECT * FROM huella_carbono.viaje;
SELECT * FROM huella_carbono.viaje
where cod_usuario in (1007,1000);

SELECT * FROM huella_carbono.recomendacion order by tipo;

SELECT * FROM huella_carbono.asignacion;

truncate table huella_carbono.asignacion;
DELETE FROM `huella_carbono`.`viaje` WHERE `cod_viaje`='28' and`cod_usuario`='1000';
DELETE FROM `huella_carbono`.`viaje` WHERE `cod_viaje`='29' and`cod_usuario`='1000';

