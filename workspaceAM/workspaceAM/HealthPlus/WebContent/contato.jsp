<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@include file="includes/head.jsp" %>
  <title>Health Plus - Contato</title>
</head>
<body>
  <div class="container-fluid">
    <%@include file="includes/menu_nao_logado.jsp" %>
    <main>
      <div class="row">      
        <div class="w-100 mt-5">
        <c:if test="${not empty msg}">
			<div class="alert alert-success">
				${msg}
			</div>
		</c:if>
          <h3 class="py-3 text-center text-info">Formulário de Contato</h3>
        </div>
      </div>
      <div class="row">
        <form action="HealthServlet" method="post" class="mx-auto my-3" id="form_contato">
          <input type="hidden" name="acao" value="cadastrarFormularioContato">
          <input type="text" name="nome" id="nome" class="form-control mb-4" size="80" placeholder="Nome Completo" required autocomplete="off">
          <input type="email" name="email" id="email" class="form-control mb-4" size="80" placeholder="Email"  required autocomplete="off">
          <select name="tipo_msg" id="tipo_msg" class="form-control mb-4 col-sm-4" required>
            <option value="">Escolha o assunto:</option>
            <option value="sugestoes">Sugestões</option>
            <option value="duvidas">Dúvidas</option>
            <option value="criticas">Críticas</option>
            <option value="elogios">Elogios</option>
          </select>
          <textarea name="msgem" id="msg" class="form-control mb-4" rows="10" required></textarea>
          <input type="submit" value="Enviar" name="botao" class="btn btn-outline-success btn-sm">
          <input type="reset" value="Limpar Formulário" class="btn btn-outline-danger btn-sm">
        </form>
      </div>
    </main>
     <%@include file="includes/rodape_nao_logado.jsp" %>
  </div>
 <%@include file="includes/foot.jsp" %>
