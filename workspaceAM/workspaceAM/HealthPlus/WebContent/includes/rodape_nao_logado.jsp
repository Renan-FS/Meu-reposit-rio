<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ include file="chat.jsp" %>
 <footer>
      <div class="row bg-light pb-2 pt-5 px-5">
        <div class="col-6 col-sm-6 col-md-2 col-lg-2 col-xl-2">
          <a href="#top"><img class="w-75 img-fluid" src="imagens/logo_maior.png" alt="Health Plus" title="Health Plus"></a>
        </div>
        <div class="col-6 col-sm-6 col-md-3 col-lg-3 col-xl-3">
          <ul class="list-unstyled mt-3">
            <li>Av. Lins de Vasconselos, 1200</li>
            <li>Aclimação - São Paulo/SP</li>
            <li>Tel: (11) 9-1234-9876</li>
          </ul>
        </div>
        <div class="col-6 col-sm-4 col-md-2 col-lg-2 col-xl-2">
          <ul class="list-unstyled">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="institucional.jsp">Institucional</a></li>
            <li><a href="contato.jsp">Contato</a></li>
            <li><a href="#" data-toggle="modal" data-target="#cadastro">Cadastre-se</a></li>
            <li><a href="#" data-toggle="modal" data-target="#login">Login</a></li>
          </ul>
        </div>
        <div class="col-6 col-sm-4 col-md-3 col-lg-3 col-xl-3">
          <ul class="list-unstyled mt-3">
            <li><a href="http://www.testes.sampa/am/index.html">www.healthplus.com.br</a></li>
            <li>healthplusoficial@gmail.com</li>
          </ul>
        </div>
        <div class="col-12 col-sm-4 col-md-2 col-lg-2 col-xl-2">
          <a href="https://www.facebook.com/Health-Plus-312936049457586" target="_blank"><img src="imagens/icone_facebook.png" class="d-inline-block m-1" alt="Facebook Health Plus" title="Facebook Health Plus"></a>
          <a href="https://twitter.com/HealthPlus14" target="_blank"><img src="imagens/icone_twitter.png" class="d-inline-block m-1" alt="Twitter Health Plus" title="Twitter Health Plus"></a>
          <a href="https://www.instagram.com/healthplusoficial/?hl=pt-br" target="_blank"><img src="imagens/icone_instagram.png" class="d-inline-block m-1" alt="Instagram Health Plus" title="Instagram Health Plus"></a>
          <p class="text-info mt-3">Acompanhe nossas Redes Sociais</p>
        </div>
        <p class="m-auto d-block text-secondary" id="copy">Health Plus &copy - Todos os direitos reservados - 2018</p>
      </div>
    </footer>
    <!-- Modal -->
    <div class="modal fade" id="cadastro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <div class="col-6 col-sm-6 col-md-9 col-lg-9 col-xl-9">
              <h5 class="modal-title text-info" id="exampleModalLabel">Formulário de Cadastro</h5>
            </div>
            <div class="col-6 col-sm-6 col-md-3 col-lg-3 col-xl-3">
              <img src="imagens/logo.png" alt="Health Plus" class="w-50">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          </div>
          <div class="modal-body">
            <form action="#" method="post" id="form_cadastro_usuario">
              <input type="text" id="nome_cadastra" class="form-control mb-4 mx-auto w-75" name="nome_cadastra" placeholder="Nome Completo" required>
              <input type="email" id="email_cadastra" class="form-control mb-4 mx-auto w-75" name="email_cadastra" placeholder="Email" required>
              <input type="password" id="senha_cadastra" class="form-control mb-4 mx-auto w-75" name="senha_cadastra" placeholder="Digite uma senha" required>
              <input type="password" id="confirme_senha_cadastra" class="form-control mb-4 mx-auto w-75" name="confirme_senha_cadastra" placeholder="Confirme sua senha" required>
              <input type="submit" value="Cadastrar" class="btn btn-outline-success btn-sm mx-auto d-block my-4">
            </form>
            <div id="msg_token">
              <p>Enviamos para sua caixa de entrada um email de confirmação. Clique no link do email para finalizar seu cadastro.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <div class="col-6 col-sm-6 col-md-9 col-lg-9 col-xl-9">
              <h5 class="modal-title text-info" id="exampleModalLabel">Formulário de Login</h5>
            </div>
            <div class="col-6 col-sm-6 col-md-3 col-lg-3 col-xl-3">
              <img src="imagens/logo.png" alt="Health Plus" class="w-50">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          </div>
          <div class="modal-body">
            <form action="#" method="post" id="form_login_usuario">
              <input type="email" id="email_login" class="form-control mb-4 mx-auto w-75" name="email_login" placeholder="Email" required>
              <input type="password" id="senha_login" class="form-control mb-4 mx-auto w-75" name="senha_login" placeholder="Digite uma senha" required>
              <input type="submit" value="Login" class="btn btn-outline-success btn-sm mx-auto d-block my-4">
            </form>
            <a href="#modal_senha" data-toggle="modal">Esqueceu sua senha?</a>
          </div>
        </div>
      </div>
    </div>
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