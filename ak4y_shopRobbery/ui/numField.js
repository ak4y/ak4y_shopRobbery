var audioPlayer = null;
var currentCode = "";
var ilkDeneme = false;
var denemeSayisi = 0;

function uniq(){
    var digits = "123456789".split(''),
        first = shuffle(digits).pop();
    digits.push('0');
    return parseInt( first + shuffle(digits).join('').substring(0,3), 10);
}

function shuffle(o){
    for(var j, x, i = o.length; i; j = Math.floor(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);
    return o;
}

function animasyon(){
	var width = $( window ).width()/2;
	$( ".minisafe" ).animate({ "margin-right": width-188.5+"px" }, 1000 );
		setTimeout(
		function()
		{
			$(".minisafe").addClass( "ortala" )
		}, 1000);
	$( ".minisafe" ).animate({ "margin-right": "0", "height": "2130px", "width": "1400px",}, 1000 );
	$( ".minisafe" ).css({"position": "absolute", "top": "0", "left": "0", "right": "0", "bottom": "0", "margin": "auto"});
	setTimeout(
	function()
	  {
		$( ".safe" ).show();
		setTimeout(
		function()
		{
			$( ".minisafe" ).hide();
		}, 100);
	  }, 2000);
}

function kasaKirildi(){
	$.post('http://ak4y_shopRobbery/kasaKirildi', JSON.stringify({}));
	setTimeout(
	function()
	  {
		ilkDeneme = false;
		currentCode = "";
		$(".key").prop('disabled', false);
		$(".pass").delay( 800 ).html("PASSWORD");
		$(".inputbg").css("background-color", "#c9dddc");
	  }, 2000);
	  $(".key").removeClass( "silik" );
	  $(".key").removeClass( "dmg" );
	pass = uniq();
	eskit();
	setTimeout(
	  function() 
	  {
		document.location.href = document.location.href;
	  }, 2000);
}

function sifreUyusmadi(){
	denemeSayisi = denemeSayisi + 1;
	if(!ilkDeneme){
		ilkDeneme = true;
		$(".denemeler").html(''+currentCode);
	}else{
		var eskiCode = $('.denemeler').html();
		$(".denemeler").html(''+eskiCode+' '+currentCode);
	}
	if(denemeSayisi == 12){
		kasaKirildi();
	}
	$(".inputbg").css("background-color", "#b33434");
	deniedd.play();
	$(".pass").html("INCORRECT").fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
	setTimeout(
	  function() 
	  {
		currentCode = "";
		$(".key").prop('disabled', false);
		$(".pass").delay( 800 ).html("PASSWORD");
		$(".inputbg").css("background-color", "#c9dddc");
	  }, 3000);
}

function sifreBulundu(){
	$(".inputbg").css("background-color", "#4dab4d");
	safeopened.play();
	$(".pass").html("CORRECT").fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
	setTimeout(
		function() 
		{
			$.post('http://ak4y_shopRobbery/basarili', function() {});
		}, 700);
	setTimeout(
	function()
	  {
		currentCode = "";
		ilkDeneme = false;
		$(".key").prop('disabled', false);
		$(".pass").delay( 800 ).html("PASSWORD");
		$(".inputbg").css("background-color", "#c9dddc");
	  }, 2000);
	setTimeout(
		function() 
		{
			$(".key").removeClass( "silik" );
			$(".key").removeClass( "dmg" );
			pass = uniq();
			eskit();
		}, 720);
	setTimeout(
	  function() 
	  {
		document.location.href = document.location.href;
	  }, 2000);
}

var pass = uniq();
function eskit(){
	numbers = pass.toString().split("");
	$('#key'+numbers[0]).addClass("dmg");
	$('#key'+numbers[1]).addClass("silik");
	$('#key'+numbers[2]).addClass("silik");
	$('#key'+numbers[3]).addClass("silik");
}

$(document).ready(function(){
    if (audioPlayer != null) {
        audioPlayer.pause();
    }
	eskit();
    audioPlayer = new Howl({src: ["sounds/numField.mp3"]});
    deniedd = new Howl({src: ["sounds/deniedd.mp3"]});
    safeopened = new Howl({src: ["sounds/safeopened.mp3"]});
    audioPlayer.volume(50.0);
    deniedd.volume(50.0);
    safeopened.volume(50.0);
    function password(v){
		if(currentCode.length != 4){
			currentCode = currentCode + v;
			$(".pass").html(currentCode);
		}
		if(currentCode.length === 4){
			$(".key").prop('disabled', true);
			audioPlayer.play();
			if(parseInt(currentCode) != pass){
				sifreUyusmadi();
			}else{
				sifreBulundu();
			}
		}
	}
	
	 $(".key").click(function() {
		index = $(this).data("id");
		audioPlayer.play();
		password(index);
	});

	document.onkeyup = function (data) {
        if (data.which == 27 ) {
			$.post('http://ak4y_shopRobbery/basarisiz', JSON.stringify({}));
			setTimeout(
				function()
				  {
					ilkDeneme = false;
					currentCode = "";
					$(".key").prop('disabled', false);
					$(".pass").delay( 800 ).html("PASSWORD");
					$(".inputbg").css("background-color", "#c9dddc");
				  }, 2000);
				  $(".key").removeClass( "silik" );
				  $(".key").removeClass( "dmg" );
				denemeSayisi = 0;
				pass = uniq();
				eskit();
				setTimeout(
				  function() 
				  {
					document.location.href = document.location.href;
				  }, 2000);
        }
    };
    window.addEventListener('message', function(event) {
        var data = event.data;
        currentCode = "";  
        if (event.data.type == "enableui") {
			$('body').css('display', event.data.enable ? "block" : "none")
			animasyon()
        }
    });
});