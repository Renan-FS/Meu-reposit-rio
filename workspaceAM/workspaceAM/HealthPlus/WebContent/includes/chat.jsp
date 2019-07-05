<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<div class="row">
<div class="col-0 col-sm-9 col-md-6 col-lg-9 col-xl-9"></div>
<div class="col-12 col-sm-3 col-md-6 col-lg-3 col-xl-3 container w-100">
		<h6 class="text-center text-primary">Pesquise sua Clínica via CHAT<a class="nav-brand" id="idDuvidas" href="#"><img src="imagens/botao_fechar_preto.png" alt="Botão fechar" title="Botão fechar" class="m-1 ml-5"></a></h6>
		
<div class="caixa">
		<div class="chat w-100 bg-white">		
		<c:forEach items="${conversa }" var="dialogo">
		${dialogo}
		</c:forEach>
		</div>
		<form action="Chatbot" method="post">
			<input type="text" id="idPergunta" class="form-control mx-auto w-100 my-2" autocomplete="off" name="pergunta">
			<input id="idSubmit" class="btn btn-success btn-sm w-100" type="submit">
		</form>
		</div>
</div>
</div>