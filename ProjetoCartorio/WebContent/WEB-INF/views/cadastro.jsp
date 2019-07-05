<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Cadastro de Cart�rio</title>
</head>
<body>

	<h2>Formul�rio de Cadastro de Cart�rios</h2>
	<form:form method="POST" action="/cartorio/addCartorio">
		<table>
			<tr>
				<td><form:label path="nome">Nome></form:label></td>
				<td><form:input path="nome" /></td>
			</tr>

		</table>
	</form:form>
	<a href="/cartorio/listaCartorios">Lista</a>

</body>
</html>