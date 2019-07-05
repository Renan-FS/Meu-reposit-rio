<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@include file="includes/head.jsp" %>
  <title>Health Plus - Administrador</title>
</head>
<body>
  <div class="container-fluid">
    <%@include file="includes/menu_admin.jsp" %>
    <main>
      <div class="row">
        <div class="mt-5 mb-2 mx-5">
          <h6>Bem vindo! Você está na área de Administrador!</h6>
        </div>
      </div>
      <div class="row">
        <div class="table-responsive m-5">
          <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Usuário</th>
                <th scope="col">Email</th>
                <th scope="col">CRM</th>
                <th scope="col">Status</th>
                <th scope="col">Ações</th>
              </tr>             
            </thead>
            <tbody>
            <c:forEach items="${lista}" var="usuario">
              <tr>
                <td scope="row">${usuario.getCodigo()}</td>
                <td>${usuario.getNome()}</td>
                <td>${usuario.getEmail()}</td>
                <td>${usuario.getCrm()}</td>
                <td>${usuario.getDelete()}</td>
                <c:choose>
				    <c:when test="${usuario.getDelete() == 'N'}"> 
	                <td>Ativo</td>
				    </c:when>
				    <c:when test="${usuario.getDelete() == 'Y'}"> 
	                <td>Desativado</td>
				    </c:when>     
				    <c:otherwise>
				        <td>Desativado</td> 
				    </c:otherwise>
				</c:choose>
                <td>
					<c:url value="HealthServlet" var="link1">
						<c:param name="acao" value="carregarUsuario"/>
						<c:param name="codigo" value="${usuario.codigo}"/>
					</c:url>				
					<a href="${link1}" class="btn btn-info">Alterar</a>
					
					<c:url value="HealthServlet" var="link2">
						<c:param name="acao" value="remover"/>
						<c:param name="codigo" value="${usuario.codigo}"/>
					</c:url>
					<a href="${link2}" class="btn btn-danger">Desativar</a>
					
					<c:url value="HealthServlet" var="link3">
						<c:param name="acao" value="carregarUsuario"/>
						<c:param name="codigo" value="${usuario.codigo}"/>
					</c:url>
					<a class="btn btn-primary" href="${link3}">Visualizar</a>					
				</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </main>
   <%@include file="includes/rodape_admin.jsp" %>
  </div>
 <%@include file="includes/foot.jsp" %>

