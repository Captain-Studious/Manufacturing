
$(window).load(function(){

  $('.containmain').slideDown(560);

});

$(window).ready(function(){
  $(".topform , .bottomform").focus(function() {
    $(this).css({'background-image': 'none'});
});
  
  
  if ($('.topform').is(':empty')){
  
  $(".topform").focusout(function(){
   imageUrl = '16612.png';
    $(this).css('background-image', 'url(' + imageUrl + ')'); 
  });
    
  } else if ($('.topform').not(':empty')){
  
     $(this).css('background-image', 'none'); 
    
  }
  
  
    $(".bottomform").focusout(function(){
   imageUrl = '25239.png';
    $(this).css('background-image', 'url(' + imageUrl + ')'); 
  });
 
  /*$('.close').click(function(){
    $('.containmain').slideUp(function(){
   
    
      $('.close').text("FANCY RENT A CAR").addClass("not");
    
    
    });
                                
                               
    
    
  
  });*/
  
  
 /* $("#close").click(function(){
  
    if ($( "#close" ).hasClass( "not" )){
      $('.containmain').slideDown(function(){
  
    $('.close').text("FANCY RENT A CAR").removeClass("not");
  });
 
  }
  
  });*/
  
  
  
  
  
});