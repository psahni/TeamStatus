var htmlize = 'htmlize',
boldCharCode = 66,
insertBoldTag = function(){
  $("." + htmlize).keydown(function(event){
    if(event.ctrlKey && event.keyCode == boldCharCode){
        var newValue = $(this).val() + "<strong></strong>";
        $(this).val(newValue);
        $(this).focusEnd($(this).val().length - 9);
    }
  })
}

$(document).ready(function(){
    insertBoldTag();
});
