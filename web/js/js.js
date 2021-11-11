$(document).ready(function($) {

	var $width = $( window ).width();
        

$('.je_boton').click(function() {
         var doc = new jsPDF();
var elementHTML = $('.container').html();
var specialElementHandlers = {
    '#elementH': function (element, renderer) {
        return true;
    }
};
doc.fromHTML(elementHTML, 15, 15, {
    'width': 170,
    'elementHandlers': specialElementHandlers
});

// Save the PDF
doc.save('sample-document.pdf');
      });

	//*****************MENU DESAPARECE********************
var lastScrollTop = 0;
$(window).scroll(function(event){
  var st = $(this).scrollTop();
  if (st > lastScrollTop){
    setTimeout(function(){
      $('header').css('transform','translateY(-100%)');
    },150)
  } else {
    setTimeout(function(){
      $('header').css('transform','none');
    },150)
  }
  lastScrollTop = st;
});


//*****************RESPONSIVE********************

if($width <= 767){
  //*****************MENU FIXED********************
    var lastScrollTop = 0;
  $(window).scroll(function(event){
    var st = $(this).scrollTop();
    if (st > lastScrollTop){
      setTimeout(function(){
        $('header').css('transform','none');
      },150)
    } else {
      setTimeout(function(){
        $('header').css('transform','none');
      },150)
    }
    lastScrollTop = st;
  });
    
  }
  
  
  //------------------------------------------------
  function parametroURL(_par) {
  var _p = null;
  if (location.search) location.search.substr(1).split("&").forEach(function(pllv) {
    var s = pllv.split("="), //separamos llave/valor
      ll = s[0],
      v = s[1] && decodeURIComponent(s[1]); //valor hacemos encode para prevenir url encode
    if (ll == _par) { //solo nos interesa si es el nombre del parametro a buscar
      if(_p==null){
      _p=v; //si es nula, quiere decir que no tiene valor, solo textual
      }else if(Array.isArray(_p)){
      _p.push(v); //si ya es arreglo, agregamos este valor
      }else{
      _p=[_p,v]; //si no es arreglo, lo convertimos y agregamos este valor
      }
    }
  });
  return _p;
}
$entro = parametroURL('entro');
if($entro == 0){
    alert("Credenciales incorrectas");
    $(location).attr('href','../user/');
}

}(jQuery));//end Function $


