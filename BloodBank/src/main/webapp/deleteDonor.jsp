<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");

try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    
    // Use PreparedStatement to avoid SQL injection
    PreparedStatement ps = con.prepareStatement("DELETE FROM donor WHERE id = ?");
    ps.setString(1, id);
    int rowsAffected = ps.executeUpdate();

    if (rowsAffected > 0) {
        // Record deleted successfully
        response.sendRedirect("editDeleteList.jsp?msg=delete");
    } else {
        // No records deleted (id not found)
        response.sendRedirect("editDeleteList.jsp?msg=notfound");
    }

} catch (SQLException e) {
    e.printStackTrace(); // Log the exception (don't expose stack trace to the user)
    response.sendRedirect("editDeleteList.jsp?msg=invalid");
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("editDeleteList.jsp?msg=error");
}
%>
