package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <script>\n");
      out.write("        function validate() {\n");
      out.write("            var useremail = document.form.email.value;\n");
      out.write("            var password = document.form.password.value;\n");
      out.write("            if (useremail == \"\") {\n");
      out.write("                alert(\"Enter UserEmail!\");\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            if (password == \"\") {\n");
      out.write("                alert(\"Enter Password!\");\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            return true;\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("    <body>\n");
      out.write("        <style>\n");
      out.write("            *{\n");
      out.write("                padding:0;\n");
      out.write("                margin:0;\n");
      out.write("                border: 0;\n");
      out.write("                font-family:sans-serif;\n");
      out.write("            }\n");
      out.write("            input{\n");
      out.write("                background-color:#008080;\n");
      out.write("                color: white;\n");
      out.write("                border-radius: 15px;\n");
      out.write("                width: 500px;\n");
      out.write("                height: 40px;\n");
      out.write("                margin-bottom: 30px;\n");
      out.write("                font-size: 20px;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            body{\n");
      out.write("                background-color:#004d4d ;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            form{\n");
      out.write("                margin-top: 50px;\n");
      out.write("            }\n");
      out.write("            h3{\n");
      out.write("                text-align: center;\n");
      out.write("                margin-top: 90px;\n");
      out.write("                font-family: serif;\n");
      out.write("                font-size: 30px;\n");
      out.write("                font-weight: bold;\n");
      out.write("                color: #000000;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            button{\n");
      out.write("                width: 300px;\n");
      out.write("                height: 40px;\n");
      out.write("                color: white;\n");
      out.write("                background:#008080 ;\n");
      out.write("                font-weight: bold;\n");
      out.write("                border-radius: 20px;\n");
      out.write("                font-size: 20px;\n");
      out.write("            }    \n");
      out.write("            ::-ms-input-placeholder { \n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            div{\n");
      out.write("                border-radius: 20px;\n");
      out.write("                text-align: center;\n");
      out.write("                border:1px solid gray;\n");
      out.write("                background-color: #f2f2f2;           \n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("        <div style=\"width: 600px;height:500px; margin-left:28% ;margin-top: 100px;\">\n");
      out.write("            <h3>Login Form</h3>\n");
      out.write("            <form method=\"post\" action=\"LoginServlet\" onsubmit=\"javascript:return validate();\">\n");
      out.write("                <input type=\"email\" name=\"email\" title=\"Email\" placeholder=\" Email\"/>\n");
      out.write("                <br/><br/>\n");
      out.write("                <input type=\"password\" name=\"password\" placeholder=\" Password\"/>\n");
      out.write("                <br/><br/>\n");
      out.write("                <button type=\"submit\">Login</button>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
