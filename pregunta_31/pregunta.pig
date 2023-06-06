/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS (col1:int, col2:chararray, col3:chararray, col4:chararray,col5:chararray, col6:int);
data1 = FOREACH data GENERATE SUBSTRING(col3, 0, 4) AS yearBirthday;
data2 = GROUP data1 BY yearBirthday;
respuesta = FOREACH data2 GENERATE $0, COUNT($1);
STORE respuesta INTO 'output' using PigStorage(',');
