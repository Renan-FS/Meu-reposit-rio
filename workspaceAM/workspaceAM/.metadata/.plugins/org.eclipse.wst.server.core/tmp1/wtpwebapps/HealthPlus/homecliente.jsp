<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@include file="includes/head.jsp" %>
  <title>Health Plus - Home Cliente</title>
</head>
<body>
  <div class="container-fluid">
   <%@include file="includes/menu_logado.jsp" %>
    <main>
      <div class="row">
        <div class="mt-5 mb-2 mx-5">
          <h6>Bem vindo Milton!</h6>
        </div>
      </div>
      <div class="row">
        <a href="cadastroclinica.jsp"><button class="btn btn-outline-success btn-sm m-5">Adicionar Clínica</button></a>
      </div>
      <c:if test="${not empty msg}">
		<div class="alert alert-success">
			${msg}
		</div>
	  </c:if>
      <div class="row">
        <div class="table-responsive m-5">
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">CNPJ</th>
                <th scope="col">Clínica</th>
                <th scope="col">Endereço</th>
                <th scope="col">Ações</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${lista}" var="clinica">
              <tr>
                <td scope="row">${usuario.getCodigo()}</td>
                <td>${clinica.getCnpj()}</td>
                <td>${clinica.getNome()}</td>
                <td>${clinica.getEndereco(endereco.getLogradouro())}</td>
                <td>
					<c:url value="HealthServlet" var="link1">
						<c:param name="acao" value="exibir"/>
						<c:param name="codigo" value="${usuario.codigo}"/>
					</c:url>				
					<a href="${link1}" class="btn btn-info">Alterar</a>
					<c:url value="clienteServlet" var="link">
						<c:param name="acao" value="remover"/>
						<c:param name="codigo" value="${usuario.codigo}"/>
					</c:url>
					<a class="btn btn-danger" href="${link}">Desativar</a>					
				</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </main>
   <%@include file="includes/rodape_logado.jsp" %>
  </div>
 <%@include file="includes/foot.jsp" %>

