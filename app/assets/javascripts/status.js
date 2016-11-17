var htmlize = 'htmlize',
boldCharCode = 66,

insertBoldTag = function(){
  $("." + htmlize).keydown(function(event){
    if(event.ctrlKey && event.keyCode == boldCharCode){
        var newValue = $(this).val() + "<strong></strong>";
        $(this).val(newValue);
        $(this).focusEnd($(this).val().length - 9);
    }
  });
},

enableAddMore = function(){
  $('[data-form-prepend]').click(function(e){
      e.preventDefault;
      var htmlToAppend = $(this).data('formPrepend'),
          $containerElement = "." + $(this).attr('append-container');
      htmlToAppend = htmlToAppend.replace(/_new_/g, (new Date()).getTime());
      console.log(htmlToAppend);
      $($containerElement).append(htmlToAppend);
  });
}

$(document).ready(function(){
    enableAddMore()
});
