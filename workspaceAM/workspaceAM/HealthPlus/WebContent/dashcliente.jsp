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
                <th scope="col">Qtde. de Clínicas</th>
                <th scope="col">Status</th>
                <th scope="col">Ações</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td scope="row">${usuario.getCodigo()}</td>
                <td>${usuario.getNome()}</td>
                <td>${usuario.getEmail()}</td>
                <td>${usuario.getCrm()}</td>
                <td>${usuario.getCrm()}</td>
                <td>${usuario.getDelete()}</td>
                <c:choose>
				    <c:when test="${usuario.getDelete() == 'N'}"> 
	                <td>Ativo</td>
				    </c:when>    
				    <c:otherwise>
				        <td>Desativado</td> 
				    </c:otherwise>
				</c:choose>
                <td>
                <td>
					<c:url value="HealthServlet" var="link1">
						<c:param name="acao" value="exibir"/>
						<c:param name="codigo" value="${usuario.codigo}"/>
					</c:url>				
					<a href="${link1}" class="btn btn-info">Alterar</a>
					<c:url value="HealthServlet" var="link">
						<c:param name="acao" value="remover"/>
						<c:param name="codigo" value="${usuario.codigo}"/>
					</c:url>
					<a class="btn btn-danger" href="${link}">Desativar</a>					
				</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
          <!-- accordion -->
          <div class="row my-3">
            <div class="w-75 mx-auto">
                <h3 class="text-info text-center my-3">Minhas Clínicas</h3>
              <div id="accordion">

                <c:forEach items="${lista}" var="clinica">                 
	              <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
	                <div class="card-body">
	                  <ul class="list-unstyled">
	                <li>${clinica.getNome()}</li>
	                <li>${clinica.getEndereco()}</li>
	                <li>${clinica.getTelefone()}</li>
	                <li>${clinica.getSite()}</li>
	                <li>${clinica.getEmail()}</li>
	                <li>${clinica.getHorario()}</li>
	                  </ul>
	                <!-- </div> -->
	              </div>
           	 </c:forEach>
                <!--<div class="card">
                  <div class="card-header" id="headingTwo">
                    <h5 class="mb-0">
                      <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        Clínica de Saúde Pompéia
                      </button>
                    </h5>
                  </div>
                  <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                    <div class="card-body">
                      <ul class="list-unstyled">
                        <li>Rua Homem de Melo, 117</li>
                        <li>Pompéia - SP</li>
                        <li>(11) 3005-5687 / 9-4889-5066</li>
                        <li><a href="http://www.clinicapompeia.com.br" target="_blank">www.clinicapompeia.com.br</a></li>
                        <li>pompeiaclinica@clinica.com.br</li>
                        <li>De Seg. à Sex.</li>
                        <li>Das 08:00hs às 17:00hs</li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header" id="headingThree">
                    <h5 class="mb-0">
                      <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        Clínica de Saúde Pró-Matre
                      </button>
                    </h5>
                  </div>
                  <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                    <div class="card-body">
                      <ul class="list-unstyled">
                        <li>Alameda Campinas, 65</li>
                        <li>Jardins - SP</li>
                        <li>(11) 3088-1887 / 9-8664-5879</li>
                        <li><a href="http://www.clinicapromatre.com.br" target="_blank">www.clinicapromatre.com.br</a></li>
                        <li>promatre@clinica.com.br</li>
                        <li>De Seg. à Seg.</li>
                        <li>24hs</li>
                      </ul>
                    </div>
                  </div>
                </div> -->
              </div>
            </div>
            <!-- fim accordion -->
      </div>
    </main>
   <%@include file="includes/rodape_admin.jsp" %>
  </div>
 <%@include file="includes/foot.jsp" %>
