﻿
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЗаявкаКлиента") Тогда
		// Заполнение шапки
		Клиент = ДанныеЗаполнения.Клиент;
		Комментарий = ДанныеЗаполнения.Комментарий;
		Основание = ДанныеЗаполнения.Ссылка;
		СтатусОплаты = ДанныеЗаполнения.Статус;
		Сумма = ДанныеЗаполнения.СуммаЗаявки;
	КонецЕсли;
	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры

Процедура ОбработкаУдаленияПроведения(Отказ)
	// Вставить содержимое обработчика.
	Если Не СтатусОплаты Тогда
		Сообщить("Отмена проведения доступна только для документов со Статусом оплаты = Нет.");
		Отказ = Истина;
	КонецЕсли;
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр Продажи 
	Движения.Продажи.Записывать = Истина;
	Для Каждого ТекСтрокаУслуги Из Услуги Цикл
		Движение = Движения.Продажи.Добавить();
		Движение.Период = Дата;
		Движение.Дата = Дата;
		Движение.Клиент = Клиент;
		Движение.Номенклатура = ТекСтрокаУслуги.Номенклатура;
		Движение.Количество = ТекСтрокаУслуги.Количество;
		Движение.Сумма = ТекСтрокаУслуги.Сумма;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
