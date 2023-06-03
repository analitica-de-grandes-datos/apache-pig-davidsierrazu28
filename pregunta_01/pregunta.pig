/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:chararray, col2:chararray, col3:int);
letras = group data BY col1;
contar_letras = FOREACH letras GENERATE group, COUNT(data);
STORE contar_letras INTO 'output' USING PigStorage(',');


