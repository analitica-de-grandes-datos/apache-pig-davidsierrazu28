/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:chararray, col2:bag{dict:TUPLE(letter:chararray)}, col3:map);
columna2 = FOREACH data GENERATE col2;
letras = FOREACH columna2 GENERATE FLATTEN letra;
agrupar = group letras BY letra;
conteo = FOREACH agrupar GENERATE group,COUNT(letra);
STORE 'conteo' INTO 'output' USING PigStorage(',');
