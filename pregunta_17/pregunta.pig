/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, color 
   FROM 
       u
   WHERE color IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' using PigStorage(',') AS (col1:int, col2:chararray, col3:chararray, col4:chararray, col5:chararray, col6:int);
data1 = FILTER data BY (col5 matches 'blue') or (col5 matches 'black');
data2 = FOREACH data1 GENERATE col2, col5;
STORE data2 INTO 'output' using PigStorage(',');

