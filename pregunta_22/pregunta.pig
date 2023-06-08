/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u
   WHERE 
       color REGEXP '.n';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (col1:int, col2:chararray, col3:chararray, col4:chararray,col5:chararray, col6:int);
condicion = FILTER data BY (col5 MATCHES '.*n$');
respuesta = FOREACH condicion GENERATE col2,col5;
STORE respuesta INTO 'output' USING PigStorage(',');
