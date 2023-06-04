/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (col1:int, col2:chararray, col3:chararray, col4:chararray,col5:chararray, col6:int);
respuesta = FOREACH data GENERATE col3, SIZE(col3) as tamano;
respuesta_ordenada = order respuesta by tamano desc, col3;
respuesta_5 = limit respuesta_ordenada 5;
STORE respuesta_5 INTO 'output' USING PigStorage(',');
