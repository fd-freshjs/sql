SELECT * FROM users WHERE full_name = '';

/* ПОИСК ПО ШАБЛОНУ */

/* 
  glob patterns / wildcards

  posix / regexp

  sql regexp
 */

/* 
  glob

  * - любой символ в любом кол-ве (0 до ~)
  ? - любой один символ
  + - один и более символов
  [0-9], [A-Z], [A-Za-z0-9\-] - диапазон для поиска одного символа

  запросы:
  *.txt - любой файл с окончанием .txt

 */

/* 
  js regexp / posix
  
  джокер типа:
  . - любой символ
  [0-9] - диапазон

  джокеры количества:
  * - любое кол-во (0 до ~)
  ? - один или 0 символов
  + - один и более символов
  {10,} - от 10 до бесконечности
  {1,5} - о 1 до 5

  запросы:
  .*\.txt
  380[0-9]+
  380[0-9]{9,9}
  Char.+

 */

SELECT * FROM users WHERE full_name ~ '^.*lie';

SELECT * FROM users WHERE full_name ~* 'Lie ';

SELECT * FROM users WHERE full_name !~* 'Lie ';
