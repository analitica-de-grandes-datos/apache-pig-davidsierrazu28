/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:chararray, col2:bag{dict:TUPLE(letra:chararray)}, col3:map[]);
respuesta = FOREACH data GENERATE col1, (int)COUNT(col2) AS contcol2, (int) SIZE(col3) AS contcol3;
respuesta_ordenada = order respuesta by col1, contcol2, contcol3;
STORE respuesta_ordenada INTO 'output' USING PigStorage(',');
