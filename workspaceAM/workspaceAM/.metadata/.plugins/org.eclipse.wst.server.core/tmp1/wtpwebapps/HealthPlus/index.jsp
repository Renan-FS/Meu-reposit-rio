<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@include file="includes/head.jsp" %>
  <title>Health Plus</title>
</head>
<body>
  <div class="container-fluid">
    <%@include file="includes/menu_nao_logado.jsp" %>
    <main>
      <!-- banner -->
      <div class="row">
        <div id="carouselExampleSlidesOnly" class="carousel slide mt-5" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="imagens/banner1.jpg" alt="Banner Home" title="Banner Home">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="imagens/banner2.jpg" alt="Banner Home" title="Banner Home">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="imagens/banner3.jpg" alt="Banner Home" title="Banner Home">
            </div>
          </div>
        </div>
      </div>
      <!-- fim banner -->
      <!-- accordion -->
      <div class="row mt-3">
        <div class="col-12 col-sm-12 col-md-8 col-lg-8 col-xl-8">
            <h3 class="text-info text-center my-3">Clínicas Mais Pesquisadas</h3>
          <div id="accordion">
            <div class="card">
              <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                  <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
Nome da Clinica
                  </button>
                </h5>
              </div>
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
                <li>${clinica.getNome()}</li>
                  </ul>
                </div>
              </div>
            </c:forEach>  
            </div>
            <div class="card">
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
            </div>
          </div>
        </div>
        <!-- fim accordion -->
        <!-- cards -->
        <div class="col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
          <h3 class="text-info text-center my-3">Depoimentos</h3>
          <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <div class="card">
                  <img class="card-img-top w-75 mx-auto my-5" src="imagens/avatar1.jpg" alt="Foto Depoimento 1" title="Foto Depoimento 1">
                  <div class="card-body">
                    <h5 class="card-title mb-5">Prof.Humberto</h5>
                    <p class="card-text">"Estou me sentindo um juninho perto dessa galera!"</p>
                  </div>
                </div>
              </div>
              <div class="carousel-item">
                <div class="card">
                  <img class="card-img-top img-fluid w-75 mx-auto my-5" src="imagens/avatar2.jpg" alt="Foto Depoimento 2" title="Foto Depoimento 2">
                  <div class="card-body">
                    <h5 class="card-title mb-5">Prof. Rita</h5>
                    <p class="card-text">"Pode comprar as passagens pra Boston...Nota 10!!"</p>
                  </div>
                </div>
              </div>
              <div class="carousel-item">
                <div class="card">
                  <img class="card-img-top img-fluid w-75 mx-auto my-5" src="imagens/avatar3.jpg" alt="Foto Depoimento 3" title="Foto Depoimento 3">
                  <div class="card-body">
                    <h5 class="card-title mb-5">Prof. Gondo</h5>
                    <p class="card-text">"Vale um vetor de notas 10!"</p>
                  </div>
                </div>
              </div>
              <div class="carousel-item">
                <div class="card">
                  <img class="card-img-top img-fluid w-75 mx-auto my-5" src="imagens/avatar4.jpg" alt="Foto Depoimento 4" title="Foto Depoimento 4">
                  <div class="card-body">
                    <h5 class="card-title mb-5">Prof. Allen</h5>
                    <p class="card-text">"Nem precisa de documentação...é 10!"</p>
                  </div>
                </div>
              </div>
              <div class="carousel-item">
                <div class="card">
                  <img class="card-img-top img-fluid w-75 mx-auto my-5" src="imagens/avatar5.jpg" alt="Foto Depoimento 5" title="Foto Depoimento 5">
                  <div class="card-body">
                    <h5 class="card-title mb-5">Prof. Israel</h5>
                    <p class="card-text">"Nota 10 táááááá....!"</p>
                  </div>
                </div>
              </div>
              <div class="carousel-item">
                <div class="card">
                  <img class="card-img-top img-fluid w-75 mx-auto my-5" src="imagens/avatar6.jpg" alt="Foto Depoimento 6" title="Foto Depoimento 6">
                  <div class="card-body">
                    <h5 class="card-title mb-5">Prof. Purcino</h5>
                    <p class="card-text">"Associo a agregação da nota 10 na herança desse grupo!"</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- fim cards -->
      <!-- imagem parceiros -->
      <div class="row">
        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
        <h3 class="text-info text-center my-3">Parceiros</h3>
        <img class="d-block m-auto img-fluid" src="imagens/sprite_parceiros.jpg" alt="Logos de Parceiros" title="Logos de Parceiros">
        </div>
      </div>
      <!-- fim imagem parceiros -->
    </main>  
    <%@include file="includes/rodape_nao_logado.jsp" %>
  </div>
  <%@include file="includes/foot.jsp" %>