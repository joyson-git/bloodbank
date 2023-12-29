<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String mobilenumber = request.getParameter("mobilenumber");
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("update bloodrequest set status ='complete' where mobilenumber=?");
    ps.setString(1, mobilenumber);
    ps.executeUpdate();
    response.sendRedirect("requestForBlood.jsp");
} catch (Exception e) {
    e.printStackTrace(); // Print the exception details to the console
    response.sendRedirect("errorPage.jsp"); // Redirect to an error page or handle the error accordingly
}
%>
