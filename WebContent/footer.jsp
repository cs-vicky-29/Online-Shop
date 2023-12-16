<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<%
if(!msg.equals(""))
{
	
%>
<script>
swal("Online Shopping", "<%=msg%>" , "error");
</script>
<%
}
%>
</body>
</html>