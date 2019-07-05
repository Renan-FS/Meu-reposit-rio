$('#idPergunta').focus();
	
  	  if(sessionStorage.getItem("janela") == null){
  		  sessionStorage.setItem("janela","fechada");
  	  };
  	  
  	    	
    $('#idDuvidas').click(function(){
    	if(sessionStorage.getItem("janela") == "fechada"){
    		sessionStorage.setItem("janela","aberta");
    		$('.container').css('display','block').css('height','500px');
    	}else{
    		sessionStorage.setItem("janela","fechada");
    		$('.container').css('height','45px');
    	}
    })
  	
	    setTimeout(function(){
	    	$('.chat').animate({scrollTop: 9999999}, 500);
	        $('#idPergunta').val("").focus()
	        if(sessionStorage.getItem("janela") == "fechada"){
	    		$('.container').css('display','none');
	    	}else{
	    		$('.container').css('display','block');
	    	}   	        
	    },0001);
   
    $('input').focus();
    $('input').keypress(function(event){
  var keycode = (event.keyCode ? event.keyCode : event.which);
  if(keycode == '13'){
      $('.chat').append("<p class='perg'>"+$('input').val()+"</p>")
      $('.chat').animate({scrollTop: 9999999}, 500);
      $('input').val("").focus()
      $('.chat').append("<p class='resp'> Fala do Whatson!!!</p>")
  }
});
    
    
    
    /*=================================================
    Validadores / Mascaras
    ===================================================== */
    function mascara(o, f) {
    v_obj = o
    v_fun = f
    setTimeout("execmascara()", 1)
    }

    function execmascara() {
    v_obj.value = v_fun(v_obj.value)
    }

    function leech(v) {
    v = v.replace(/o/gi, "0")
    v = v.replace(/i/gi, "1")
    v = v.replace(/z/gi, "2")
    v = v.replace(/e/gi, "3")
    v = v.replace(/a/gi, "4")
    v = v.replace(/s/gi, "5")
    v = v.replace(/t/gi, "7")
    return v
    }

    function soNumeros(v) {
    return v.replace(/\D/g, "")
    }

    function telefone(v) {
    v = v.replace(/\D/g, "") //Remove tudo o que não é dígito
    v = v.replace(/^(\d\d)(\d)/g, "($1) $2") //Coloca parênteses em volta dos dois primeiros dígitos
    if (v.length == 14){
    v = v.replace(/(\d{5})(\d)/, "$1-$2") //Coloca hífen entre o quarto e o quinto dígitos
    }else{
    v = v.replace(/(\d{4})(\d)/, "$1-$2") //Coloca hífen entre o quarto e o quinto dígitos
    }
    return v
    }

    function cpf(v) {
    v = v.replace(/\D/g, "") //Remove tudo o que não é dígito
    v = v.replace(/(\d{3})(\d)/, "$1.$2") //Coloca um ponto entre o terceiro e o quarto dígitos
    v = v.replace(/(\d{3})(\d)/, "$1.$2") //Coloca um ponto entre o terceiro e o quarto dígitos
    //de novo (para o segundo bloco de números)
    v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2") //Coloca um hífen entre o terceiro e o quarto dígitos
    return v
    }

    function cnpj(v) {
    v = v.replace(/\D/g, "") //Remove tudo o que não é dígito
    v = v.replace(/^(\d{2})(\d)/, "$1.$2") //Coloca ponto entre o segundo e o terceiro dígitos
    v = v.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3") //Coloca ponto entre o quinto e o sexto dígitos
    v = v.replace(/\.(\d{3})(\d)/, ".$1/$2") //Coloca uma barra entre o oitavo e o nono dígitos
    v = v.replace(/(\d{4})(\d)/, "$1-$2") //Coloca um hífen depois do bloco de quatro dígitos
    return v
    }

    function cep(v) {
    v = v.replace(/\D/g, "") //Remove tudo o que não é dígito
    v = v.replace(/(\d{2})(\d)/, "$1.$2") //Coloca um ponto entre o segundo e o terceiro dígitos
    v = v.replace(/(\d{3})(\d)/, "$1-$2") //Esse é tão fácil que não merece explicações
    return v
    }

    function datas(v) {
    v = v.replace(/\D/g, "") //Remove tudo o que não é dígito
    v = v.replace(/^(\d{2})(\d)/, "$1/$2") //Esse é tão fácil que não merece explicações
    v = v.replace(/^(\d{2})\/(\d{2})(\d)/, "$1/$2/$3") //Coloca ponto entre o quinto e o sexto dígitos
    return v
    }

    /*=================================================
    Valida CPF / CNPJ
    ===================================================== */
    function unformatNumber(pNum){
    return String(pNum).replace(/\D/g, "");
    //.replace(/^0+/, "")
    }
    function isCpf(cpf) {
    var soma;
    var resto;
    var i;
    if ( (cpf.length != 11) ||
    (cpf == "00000000000") || (cpf == "11111111111") ||
    (cpf == "22222222222") || (cpf == "33333333333") ||
    (cpf == "44444444444") || (cpf == "55555555555") ||
    (cpf == "66666666666") || (cpf == "77777777777") ||
    (cpf == "88888888888") || (cpf == "99999999999") ) {
    return false;
    }
    soma = 0;
    for (i = 1; i <= 9; i++) {
    soma += Math.floor(cpf.charAt(i-1)) * (11 - i);
    }
    resto = 11 - (soma - (Math.floor(soma / 11) * 11));
    if ( (resto == 10) || (resto == 11) ) {
    resto = 0;
    }
    if ( resto != Math.floor(cpf.charAt(9)) ) {
    return false;
    }
    soma = 0;
    for (i = 1; i<=10; i++) {
    soma += cpf.charAt(i-1) * (12 - i);
    }
    resto = 11 - (soma - (Math.floor(soma / 11) * 11));
    if ( (resto == 10) || (resto == 11) ) {
    resto = 0;
    }
    if (resto != Math.floor(cpf.charAt(10)) ) {
    return false;
    }
    return true;
    }

    function isCnpj(s){
    var i;
    var c = s.substr(0,12);
    var dv = s.substr(12,2);
    var d1 = 0;
    for (i = 0; i < 12; i++){
    d1 += c.charAt(11-i)*(2+(i % 8));
    }
    if (d1 == 0) return false;
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(0) != d1){
    return false;
    }
    d1 *= 2;
    for (i = 0; i < 12; i++){
    d1 += c.charAt(11-i)*(2+((i+1) % 8));
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(1) != d1){
    return false;
    }
    return true;
    }

    function isCpfCnpj(valor) {
    var retorno = false;
    var numero = valor;
    numero = unformatNumber(numero);

    if (numero.length > 11){
    if (isCnpj(numero)) {
    retorno = true;
    }
    } else {
    if (isCpf(numero)) {
    retorno = true;
    }
    }
    return retorno;
    };
