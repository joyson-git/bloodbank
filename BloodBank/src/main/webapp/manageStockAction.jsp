<%@page import="java.awt.image.IndexColorModel"%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
String bloodgroup = request.getParameter("bloodgroup");
String incdec = request.getParameter("indec");
String units = request.getParameter("units");
int units1 = Integer.parseInt(units); // Corrected the parsing of units

try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();

    if(incdec.equals("inc")) {
        st.executeUpdate("update stock set units=units+'" + units1 + "' where bloodgroup = '" + bloodgroup + "'");
    } else {
        st.executeUpdate("update stock set units=units-'" + units1 + "' where bloodgroup = '" + bloodgroup + "'");
        response.sendRedirect("manageStock.jsp?msg=valid"); // Corrected the parameter name and added a missing single quote
    }
} catch(Exception e) {
    response.sendRedirect("manageStock.jsp?msg=invalid"); // Corrected the parameter name
}
%>
