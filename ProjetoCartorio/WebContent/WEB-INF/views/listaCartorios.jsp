<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>Lista de Cartorios Cadastrados</title>
</head>
<body>
    <h2>Lista de Cartorios Cadastrados</h2>
  
    <c:if test="${not empty cartorios}">
        <table>
            <tr>
                <td>Id</td>
                <td>Nome</td>
                 
            </tr>
  
         
            <c:forEach var="listValue" items="${cartorios}">
                 
                <tr>
                    <td>${listValue.id}</td>
                    <td>${listValue.nome}</td>
                </tr>
            </c:forEach>
         
        </table>
  
    </c:if>
    <a href="/cartorio/cartorio">Cadastro</a>
     
</body>
</html>