/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:chararray, col2:bag{dict:TUPLE(letter:chararray)}, col3:map[]);
columna3 = FOREACH data GENERATE FLATTEN(col3);
agrupar= group columna3  by $0;
respuesta= FOREACH agrupar GENERATE group,COUNT($1);
STORE respuesta INTO 'output' USING PigStorage(',');
