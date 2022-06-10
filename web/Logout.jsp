
<!--UTILIZAR ESSA PÁGINA PARA FAZER TESTES ANTES DE SAIR DO "SISTEMA"-->


<%
    session.invalidate();
    response.sendRedirect("Login.jsp");
%>