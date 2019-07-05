<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@include file="includes/head.jsp" %>
  <title>Health Plus - Cadastro de Clínicas</title>
</head>
<body>
  <div class="container-fluid">
    <%@include file="includes/menu_logado.jsp" %>
    <main>
      <div class="row">
        <div class="mt-5 mb-1 mx-5">
          <h6>Bem vindo Milton!</h6>
        </div>
      </div>
      <div class="row">
        <div class="w-100 mb-3">
        <c:if test="${not empty msg}">
			<div class="alert alert-success">
				${msg}
			</div>
		</c:if>
          <h3 class="py-3 text-center text-info">Formulário de Cadastro de Clínicas</h3>
        </div>
        <!-- formulário -->
        <form action="#" method="post" class="form-group m-auto w-75" id="form_cadastroclinica">
          <input type="hidden" name="acao" value="cadastrarFormularioClinica">
          <input type="text" name="nome_estab" class="form-control mt-2" id="nome_estab" required autofocus placeholder="Nome do Estabelecimento" autocomplete="off">
          <input type="text" name="endereco" class="form-control mt-2" id="logradouro" required placeholder="Endereço Comercial" autocomplete="off">
          <div class="row w-100" style="margin: 0;">
            <input type="text" name="bairro" class="form-control mt-2 w-50" id="bairro" required placeholder="Bairro" autocomplete="off">
            <input type="text" name="cidade" class="form-control mt-2 w-25" id="cidade" required placeholder="São Paulo" disabled>
            <input type="text" name="estado" class="form-control mt-2 w-25" id="estado" required placeholder="SP" disabled>
          </div>
          <div class="row w-100" style="margin: 0;">
            <input type="text" name="cep" class="form-control mt-2 w-25" id="cep" required placeholder="CEP" autocomplete="off">
            <input type="phone" name="telefone" class="form-control mt-2 w-25" id="telefone" required placeholder="Telefone Comercial" autocomplete="off">
            <input type="email" name="email" class="form-control mt-2 w-50" id="email" required placeholder="Email Comercial" autocomplete="off">
          </div>
          <div class="row w-100" style="margin: 0;">
            <input type="text" name="cnpj" class="form-control mt-2 w-25" id="cnpj" required placeholder="CNPJ" autocomplete="off">
            <input type="text" name="especialidades" class="form-control mt-2 w-25" id="especialidades" required placeholder="Especialidades" autocomplete="off">
            <input type="text" name="site" class="form-control mt-2 w-50" id="site" required placeholder="Site (URL Comercial)" autocomplete="off">
          </div>
          <input type="text" name="horario" class="form-control mt-2" id="horario" required placeholder="Horário de Funcionamento (ex: das 08:00hs às 18:00hs)" autocomplete="off">
          <div class="row w-100" style="margin: 0;">
            <div class="custom-control custom-checkbox m-2">
              <input type="checkbox" class="custom-control-input" id="customCheck1">
              <label class="custom-control-label" for="customCheck1">Segunda</label>
            </div>
            <div class="custom-control custom-checkbox m-2">
              <input type="checkbox" class="custom-control-input" id="customCheck2">
              <label class="custom-control-label" for="customCheck2">Terça</label>
            </div>
            <div class="custom-control custom-checkbox m-2">
              <input type="checkbox" class="custom-control-input" id="customCheck3">
              <label class="custom-control-label" for="customCheck3">Quarta</label>
            </div>
            <div class="custom-control custom-checkbox m-2">
              <input type="checkbox" class="custom-control-input" id="customCheck4">
              <label class="custom-control-label" for="customCheck4">Quinta</label>
            </div>
            <div class="custom-control custom-checkbox m-2">
              <input type="checkbox" class="custom-control-input" id="customCheck5">
              <label class="custom-control-label" for="customCheck5">Sexta</label>
            </div>
            <div class="custom-control custom-checkbox m-2">
              <input type="checkbox" class="custom-control-input" id="customCheck6">
              <label class="custom-control-label" for="customCheck6">Sábado</label>
            </div>
            <div class="custom-control custom-checkbox m-2">
              <input type="checkbox" class="custom-control-input" id="customCheck7">
              <label class="custom-control-label" for="customCheck7">Domingo</label>
            </div>
          </div>
          <div class="row w-100" style="margin: 0;">
            <select name="plano" class="form-control mt-2 w-25" id="planos">
              <option value="">Plano de Saúde</option>
              <option value="Amil">Amil</option>
              <option value="Porto_Seguro">Porto Seguro</option>
              <option value="Bradesco">Bradesco</option>
              <option value="Greenline">Greenline</option>
              <option value="Sulamerica">Sulamérica</option>
            </select>
            <div class="w-75">
              <div class="custom-control custom-radio custom-control-inline mt-3 mx-3">
                <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
                <label class="custom-control-label" for="customRadioInline1">Bronze</label>
              </div>
              <div class="custom-control custom-radio custom-control-inline mt-3 mx-3">
                <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
                <label class="custom-control-label" for="customRadioInline2">Silver</label>
              </div>
              <div class="custom-control custom-radio custom-control-inline mt-3 mx-3">
                <input type="radio" id="customRadioInline3" name="customRadioInline1" class="custom-control-input">
                <label class="custom-control-label" for="customRadioInline3">Gold</label>
              </div>
            </div>
            <input type="submit" name="enviar" class="btn btn-outline-success btn-sm my-4 mr-3" value="Salvar Clínica">
            <input type="reset" name="reset" class="btn btn-outline-danger btn-sm my-4" value="Limpar Formulário">
          </div>
        </form>
        <!-- fim formulário -->
      </div>
    </main>
     <%@include file="includes/rodape_logado.jsp" %>
  </div>
 <%@include file="includes/foot.jsp" %>
