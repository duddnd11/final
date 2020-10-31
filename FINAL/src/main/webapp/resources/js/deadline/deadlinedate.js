function init(){
  $("input[name='deadlinedate']").datepicker({
    showButtonPanel: true,
    changeYear: true,
    closeText: "Close",
    yearRange: 'c-100:c+20',
    minDate: "+1w",
    dateFormat: "yy-mm-dd"
  });
}

