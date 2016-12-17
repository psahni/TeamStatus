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
      e.preventDefault();
      var htmlToAppend = $(this).data('formPrepend'),
          $containerElement = "." + $(this).attr('append-container');
      htmlToAppend = htmlToAppend.replace(/_new_/g, (new Date()).getTime());
      $($containerElement).append(htmlToAppend);
  });
},

removeTaskFields = function(){
  $(document).on('click', 'a.remove-task-link', function(e){
    e.preventDefault();
    $(this).prev().val('1')
    $(this).parent().prev().slideUp('fast');
    $(this).hide();
  });
};

displayLinks = function() {

  $('.layout_link').on('click', function(event){
    event.stopPropagation();
    $('.layout_links').toggle();
  });

  $('.layout_links').on('click', function(event){
    event.stopPropagation();
  });

  $(document).on('click', function(event){
    $('.layout_links').hide();
  });

},

autoGrowTextArea = function(){
  $('.description-field').on('keydown', function(e){
    var that = $(this);
    if (that.scrollTop()) {
        $(this).height(function(i,h){
            return h + 20;
        });
    }
  });
};

$(document).ready(function(){
  enableAddMore();
  removeTaskFields();
  displayLinks();
  //autoGrowTextArea();
});
