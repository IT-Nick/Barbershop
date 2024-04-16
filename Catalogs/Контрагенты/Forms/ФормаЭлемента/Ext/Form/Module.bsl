﻿// ++ SMPlekhanov@1bit.com 21.03.2024 [Самообучение]
// ПередЗаписью проверяет заполненность и корректность длины ИНН для юридических и физических лиц.
// Для юридического лица ИНН обязателен и должен содержать ровно 10 цифр. Для физического лица, если ИНН указан,
// он должен содержать ровно 12 цифр.
&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	Если Объект.ВидКонтрагента = ПредопределенноеЗначение("Перечисление.ВидыКонтрагентов.ЮридическоеЛицо") Тогда 
        Если Не ЗначениеЗаполнено(Объект.ИНН) Или СтрДлина(СокрЛП(Объект.ИНН)) <> 10 Тогда
       	    Сообщить("Для юридического лица ИНН обязателен и должен содержать 10 цифр.");
           	Отказ = Истина;
		КонецЕсли;
		
		// Добавлена проверка КПП для юридических лиц.
		Если Не ЗначениеЗаполнено(Объект.КПП) Тогда
			Сообщить("Для юридического лица КПП обязателен для заполнения.");
        	Отказ = Истина;
		КонецЕсли;
    ИначеЕсли Объект.ВидКонтрагента = ПредопределенноеЗначение("Перечисление.ВидыКонтрагентов.ФизическоеЛицо") Тогда
       	Если СтрДлина(Объект.ИНН) > 0 И СтрДлина(СокрЛП(Объект.ИНН)) <> 12 Тогда
       	    Сообщить("Для физического лица ИНН, если указан, должен содержать 12 цифр.");
       	    Отказ = Истина;
		КонецЕсли;         
		
		// Добавлена проверка пола для лиц физических лиц.
		Если Не ЗначениеЗаполнено(Объект.ПолКонтрагента) Тогда
			Сообщить("Для физического лица пол обязателен для заполнения.");
        	Отказ = Истина;
		КонецЕсли;
		
		// Добавлена проверка телефона для лиц физических лиц.
		Если Не ЗначениеЗаполнено(Объект.Телефон) Тогда
			Сообщить("Для физического лица телефон обязателен для заполнения.");
        	Отказ = Истина;
		КонецЕсли;
	КонецЕсли;		
КонецПроцедуры
	
//Процедура ВидКонтрагентаПриИзменении управляет видимостью. 
//Для юридических лиц КПП отображается а Дата рождения скрывается.
&НаКлиенте
Процедура ВидКонтрагентаПриИзменении(Элемент)
	Если Объект.ВидКонтрагента = ПредопределенноеЗначение("Перечисление.ВидыКонтрагентов.ЮридическоеЛицо") Тогда
		Элементы.КПП.Видимость = Истина;  
		Элементы.ДатаРождения.Видимость = Ложь;
	Иначе
		Элементы.КПП.Видимость = Ложь;
		Объект.КПП = "";
		Элементы.ДатаРождения.Видимость = Истина;
	КонецЕсли;      
КонецПроцедуры

//Устанавливаем видимость для объектов, которые уже созданы и имеют выбранный вариант контрагента.
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Если Объект.ВидКонтрагента = ПредопределенноеЗначение("Перечисление.ВидыКонтрагентов.ЮридическоеЛицо") Тогда
		Элементы.КПП.Видимость = Истина;  
		Элементы.ДатаРождения.Видимость = Ложь;
	Иначе
		Элементы.КПП.Видимость = Ложь;
		Объект.КПП = "";
		Элементы.ДатаРождения.Видимость = Истина;
	КонецЕсли;
КонецПроцедуры

//Устанавливаем видимость Количества посещений для Контрагентов типа "Клиент".
&НаКлиенте
Процедура ТипКонтрагентаПриИзменении(Элемент)
	Если Объект.ТипКонтрагента = ПредопределенноеЗначение("Перечисление.ТипыКонтрагентов.Клиент") Тогда
		Элементы.КоличествоПосещений.Видимость = Истина;  
	Иначе
		Элементы.КоличествоПосещений.Видимость = Ложь;  
	КонецЕсли;
КонецПроцедуры
// -- SMPlekhanov@1bit.com 21.03.2024 [Самообучение]
