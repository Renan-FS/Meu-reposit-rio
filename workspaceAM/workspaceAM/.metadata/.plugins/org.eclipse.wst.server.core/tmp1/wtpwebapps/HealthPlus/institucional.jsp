<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@include file="includes/head.jsp" %>
  <title>Health Plus - Institucional</title>
</head>
<body>
  <div class="container-fluid">
    <%@include file="includes/menu_nao_logado.jsp" %>
    <main>
      <div class="row">
			<img src="" alt="Nossa Equipe" title="Nossa Equipe">
        </div>
        <div class="row jumbotron mt-5 w-75 mx-auto">
          <h3>Um pouco sobre nós...</h3>
          <p class="text-justify"><strong>Milton</strong>, <strong>Renan</strong>, <strong>Lucas</strong>, <strong>Gabriel</strong>, <strong>Mateus</strong> e <strong>Bruno</strong> se conheceram em 2018, durante o curso de Análise e Desenvolvimento de sistemas, na <strong>FIAP (Faculdade de Informática e Administração Paulista)</strong> em São Paulo. E logo no início, foi criada a <strong>StarTech</strong>, o qual criou e desenvolveu as primeiras ideias do que seria o sistema <strong>Health Plus</strong>.</p>
          <p class="text-justify">O sistema foi criado com o objetivo de <strong>facilitar o acesso a informações para pessoas que pretendem marcar uma consulta médica</strong> em clínicas que façam parte de seu plano de saúde. Dessa forma, criou-se um <strong>banco de dados integrado</strong>, que une informações das mais diversas clínicas, indicando seu nome, especialidade, horário, endereço, os planos de saúde que atende, e quais as modalidades aceitas dentro de cada plano. Esse banco de dados serve de base para as consultas de quem precisa localizar alguma clínica médica.</p>
          <p class="text-justify">Esse projeto fez parte de um <strong>desafio da IBM</strong> junto à faculdade, de implementação da ferramenta <strong>Chatbot</strong>. A partir disso, surgiram as primeiras discussões de como essa tecnologia poderia ser utilizada dentro do sistema <strong>HealthPlus</strong>. Foi decidido então que o chat teria a função de interagir com o usuário. Dessa forma, quando o usuário precisar encontrar alguma clínica, ele simplesmente pergunta ao chat, que o responde prontamente.</p>
         </div>
      </main>
    <%@include file="includes/rodape_nao_logado.jsp" %>
    </div>
    <%@include file="includes/foot.jsp" %>
