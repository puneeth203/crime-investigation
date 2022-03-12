<html>
<script>
    function call() 
    {
        var name = "Gautam";
        window.location.replace("Demo2.jsp?name=" + name);
    }
</script>
<input type="button" value="Get" onclick='call()'>
<%
    String name = request.getParameter("name");
    if (name != null) 
    {
        out.println(name);
    }
%>
</html>