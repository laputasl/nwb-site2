$(function() {
  var flash = JSON.parse($.cookie('flash'));

  if(flash!=null){
    if(flash.notice!=undefined){
      $('div.flash.notice').html(flash.notice.replace(/\+/g," ")).show();
    }

    if(flash.error!=undefined){
      $('div.flash.errors').html(flash.error.replace(/\+/g," ")).show();
    }

    //set it empty json object
    $.cookie('flash', '{}', { path: '/' });
  }
});
