<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <footer>
      <div class="row bg-light pb-2 pt-5 px-5">
        <div class="col-6 col-sm-6 col-md-2 col-lg-2 col-xl-2">
          <a href="#top"><img class="w-75" src="imagens/logo_maior.png" alt="Health Plus" title="Health Plus"></a>
        </div>
        <div class="col-6 col-sm-6 col-md-3 col-lg-3 col-xl-3">
          <ul class="list-unstyled mt-3">
            <li>Av. Lins de Vasconselos, 1200</li>
            <li>Aclimação - São Paulo/SP</li>
            <li>Tel: (11) 9-1234-9876</li>
          </ul>
        </div>
        <div class="col-6 col-sm-6 col-md-2 col-lg-2 col-xl-2">
          <ul class="list-unstyled">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="institucional.jsp">Institucional</a></li>
            <li><a href="contato.jsp">Contato</a></li>
            <li><a href="HealthServlet?acao=carregarUsuarios">Dashboard</a></li>
          </ul>
        </div>
        <div class="col-6 col-sm-6 col-md-3 col-lg-3 col-xl-3">
          <ul class="list-unstyled mt-3">
            <li><a href="http://www.testes.sampa/am/index.jsp">www.healthplus.com.br</a></li>
            <li>healthplusoficial@gmail.com</li>
          </ul>
        </div>
        <div class="col-12 col-sm-12 col-md-2 col-lg-2 col-xl-2">
          <a href="https://www.facebook.com/Health-Plus-312936049457586" target="_blank"><img src="imagens/icone_facebook.png" class="d-inline-block m-1" alt="Facebook Health Plus" title="Facebook Health Plus"></a>
          <a href="https://twitter.com/HealthPlus14" target="_blank"><img src="imagens/icone_twitter.png" class="d-inline-block m-1" alt="Twitter Health Plus" title="Twitter Health Plus"></a>
          <a href="https://www.instagram.com/healthplusoficial/?hl=pt-br" target="_blank"><img src="imagens/icone_instagram.png" class="d-inline-block m-1" alt="Instagram Health Plus" title="Instagram Health Plus"></a>
          <p class="text-info mt-3">Acompanhe nossas Redes Sociais</p>
        </div>
        <p class="m-auto d-block text-secondary" id="copy">Health Plus &copy - Todos os direitos reservados - 2018</p>
      </div>
    </footer>
    <!-- modal -->
    <div class="modal fade" id="modal_senha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <div class="col-6 col-sm-6 col-md-9 col-lg-9 col-xl-9">
              <h5 class="modal-title text-info" id="exampleModalLabel">Formulário de alteração de senha</h5>
            </div>
            <div class="col-6 col-sm-6 col-md-3 col-lg-3 col-xl-3">
              <img src="imagens/logo.png" alt="Health Plus" class="w-50">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          </div>
          <div class="modal-body">
            <form action="#" method="post" id="form_alterar_senha">
              <input type="password" id="senha_nova" class="form-control mb-4 mx-auto w-75" name="senha_nova" placeholder="Nova Senha" required>
              <input type="password" id="senha_nova_confirma" class="form-control mb-4 mx-auto w-75" name="senha_nova_confirma" placeholder="Confirme Nova Senha" required>
              <input type="submit" value="Alterar" class="btn btn-outline-success btn-sm mx-auto d-block my-4">
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- fim modal -->