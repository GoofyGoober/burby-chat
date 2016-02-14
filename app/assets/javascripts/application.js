// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


function webNotificationPoll(url) {
  console.log(url)
  var id_last = $('.message').last().data('id')
  $.ajax({
    url : url, 
    data: "last_message_id="+id_last
  });
}

function isMobile(){
  if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
    return true
  } else{
    return false
  }
}

$('document').ready(function(){
  if ($('#notifications').length > 0) {
    setupChat()
  }
})

function setupChat(){
  var url = $('#notifications').data('url');
  setInterval(function(){webNotificationPoll(url)}, 5000);
  $('textarea').focus()
  $('textarea').keydown(function(event){
    if (event.keyCode == 13) {
        $('form').submit()
        
        if (isMobile()) {
          $('textarea').blur()// some code..
          ion.sound.play("urino");
        }
        
        return false;
    }
  })

  andareGiu()
}

function andareGiu(){
  //$("html, body").animate({ scrollTop: $(document).height() }, 0);
  scroll(0,document.body.scrollHeight);
}

