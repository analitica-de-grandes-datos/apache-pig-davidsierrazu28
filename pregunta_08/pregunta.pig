/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:chararray, col2:bag{dict:TUPLE(letra:chararray)}, col3:map[]);
col1_2 = FOREACH data GENERATE FLATTEN(col1),FLATTEN(col2);
group_col1_2 = group col1_2 by ($0, $1);
respuesta = FOREACH group_col1_2 GENERATE group,COUNT($1);
DUMP respuesta;
STORE respuesta INTO 'output' USING PigStorage(',');
