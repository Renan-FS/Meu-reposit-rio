<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Exibe Detalhes do Cart�rio</title>
</head>
<body>

	<h2>Detalhes do Cart�rio Cadastrado</h2>
	<table>
		<tr>
			<td>ID:</td>
			<td>${id}</td>
		</tr>
		<tr>
			<td>Nome:</td>
			<td>${nome}</td>
		</tr>
	</table>
	<a href="/cartorio/cartorio">Cadastro</a>
	<a href="/cartorio/listaCartorio">Lista</a>

</body>
</html>