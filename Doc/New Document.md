12345678901234567890123456789012345678901234567890123456789012345678901234567890
# asdf
## asdfasd
### sadfasdf


### 1. Статья.

Логически, каждая статья разделяется на структурные элементы (`section`). 
Первая структурная единица считается заголовком (`heading`) и может быть 
пропущена.

#### 1.1 HEADing (заголовок).
Заголовок может начинаться как с самого начала статьи, так и иметь отступ в 
любое количество "пустых" строк (строк содержащих только символы пробела, 
табуляции и другие непечатные символы).

Сама секция "заголовок" может состоять как из обычного текста, так и иметь 
выделенное название.

##### 1.1.1 HEADing: обычный текст.

    {
	 Обычный текст, выделенный как "заголовок, который, в результате 
     обработки и последующего форматирования должен быть
     отображен как простой абзац текста.
	 ...	
	} 

##### 1.1.2 HEADing: выделенное название.

    {
     @ Название в заголовке занимает всю первую строку.
	 Со следующей строки идет обычный текст, который, в результате 
     обработки и последующего форматирования должен быть
     отображен как простой абзац текста.
	 ...	
	} 

где:
  `@` - символ, выбранный в качестве управляющего.

#### 1.2 SECTion (секция, параграф, абзац).

 
    {Некий текст, который будет выделен как "заголовок".
	 ---
	 Секция, состоящая из обычного текста, который, в результате 
     обработки и последующего форматирования должен быть
     отображен как простой абзац текста.
	 ...	
	} 














###### asdf sadsdf




при 
возможно три варианта

 1. Заголовок отсутствует


	{@Заголовок описания.
	  Основной текст, описания Описание
		а пва п
	} 



#### обычный Текст

	{Просто обычный текст, описывающий поведение 
		а пва п
	} 

+--------------+
|ываыв|ыфваыфва|
| sdf | asdf   |
 

	{@Выделенный текст, как ЗАГОЛОВОК 
		а пва п
	} 
