/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS (
  driverId:int,
  truckId:int,
  eventTime:chararray,
  eventType:chararray,
  longitude:DOUBLE,
  latitude:DOUBLE,
  eventKey:chararray,
  correlationId:chararray,
  driverName:chararray,
  routeId:long,
  routeName:chararray,
  eventDate:chararray,
);

3_colum = FOREACH data GENERATE driverId, truckId, eventTime;
orden = ORDER 3_colum BY driverId, truckId, eventTime;
limite_10 = LIMIT orden 10;
STORE limite_10 INTO 'output' USING PigStorage(',');
