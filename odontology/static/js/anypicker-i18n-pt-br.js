/* ----------------------------------------------------------------------------- 

  AnyPicker - Customizable Picker for Mobile OS
  Version 2.0.0
  Copyright (c)2016 Curious Solutions LLP
  https://curioussolutions.in/libraries/anypicker/content/license.htm
  See License Information in LICENSE file.

  ----------------------------------------------------------------------------- */

/*
	language: Portuguese Brazil
	file: AnyPicker-i18n-pt-br
  translated by: Guilherme <guilhermefeitosa66@gmail.com>
*/

(function ($) {
  $.AnyPicker.i18n["pt-br"] = $.extend($.AnyPicker.i18n["pt-br"], {

  	// Common
  	headerTitle: "Data & Hora",
    setButton: "Confirmar",
    clearButton: "Limpar",
    nowButton: "Agora",
    cancelButton: "Cancelar",
    dateSwitch: "Data",
    timeSwitch: "Hora",

  	// DateTime
    veryShortDays: "Do_Se_Te_Qu_Qu_Se_Sá".split("_"),
    shortDays: "Dom_Seg_Ter_Qua_Qui_Sex_Sáb".split("_"),
    fullDays: "Domingo_Segunda_Terça_Quarta_Quinta_Sexta_Sábado".split("_"),
    shortMonths: "Jan_Fev_Mar_Abr_Mai_Jun_Jul_Ago_Set_Out_Nov_Dez".split("_"),
    fullMonths: "Janeiro_Fevereiro_Março_Abril_Maio_Junho_Julho_Agosto_Setembro_Outubro_Novembro_Dezembro".split("_"),
    numbers: "0_1_2_3_4_5_6_7_8_9".split("_"),
    meridiem: 
    {
     a: ["a", "p"],
     aa: ["am", "pm"],
     A: ["A", "P"],
     AA: ["AM", "PM"]
   }
 });
})(jQuery);