/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.tsv' USING PigStorage('\t') as (col1:chararray, col2:chararray, col3:int);
orden = ORDER data BY col3;
primeros_5 = LIMIT orden 5;
resultado= FOREACH primeros_5 GENERATE col3;
STORE resultado INTO 'output' USING PigStorage(',');
