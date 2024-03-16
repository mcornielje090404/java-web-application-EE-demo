<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.webclasses.jsp.Operation" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Calculator</title>

        <%--  Importing static TailwindCSS classes generated from pnpm run build  --%>
        <link href="./static.css" rel="stylesheet" />
    </head>
    <body class="flex flex-col gap-6 h-screen w-screen justify-center items-center">
        <%
            String rawVal1 = request.getParameter("val1");
            String rawVal2 = request.getParameter("val2");

            Double val1 = Double.parseDouble(rawVal1 != null && !rawVal1.isEmpty() ? rawVal1 : "0");
            Double val2 = Double.parseDouble(rawVal2 != null && !rawVal2.isEmpty() ? rawVal2 : "0");

            Operation[] operations = {
                    new Operation("+", "add"),
                    new Operation("-", "subtract"),
                    new Operation("*", "multiply"),
                    new Operation("/", "divide")
            };

            String operation = request.getParameter("operation") != null ? request.getParameter("operation") : "add";

            double output = 0.00;

            if (operation.equals("add")) {
                output = val1 + val2;
            } else if (operation.equals("subtract")) {
                output = val1 - val2;
            } else if (operation.equals("multiply")) {
                output = val1 * val2;
            } else if (operation.equals("divide")) {
                output = val1 / val2;
            }
        %>

        <div>
            <h1 class="font-bold text-xl">Calculator</h1>

            <%-- Form that calls this page again and passes in the new values --%>
            <form class="flex flex-col p-4 border rounded-md gap-4" action="index.jsp" method="post">
                <div class="flex gap-10 justify-evenly">
                    <input class="border rounded-sm" id="val1" type="text" name="val1" value="<%= val1 %>" />

                    <select class="min-w-24" id="operand-select" name="operation">
                        <% for (Operation op : operations) { %>
                            <option
                                    <%= (op.getValue().equals(operation)) ? "selected" : "" %>
                                    value="<%= op.getValue() %>"
                            >
                                <%= op.getLabel() %>
                            </option>
                        <% } %>
                    </select>

                    <input class="border rounded-sm" id="val2" type="number" name="val2" value="<%= val2 %>" />
                </div>

                <button>Submit</button>
            </form>

            <span class="text-xl">Answer: <%= output %></span>
        </div>

        <div class="flex flex-col gap-2 items-center">
            <%--
                This will re-route to a GET endpoint defined in java under the class 'HelloResource'.
                Not much happens but when actually making an API call this would be an example URL to hit.
             --%>
            <a class="text-blue-600 underline hover:text-blue-800 visited:text-purple-600" href="${pageContext.request.contextPath}/api/hello-world">Re-route to API endpoint</a>

            <%-- Example for redirecting to other pages. --%>
            <a class="text-blue-600 underline hover:text-blue-800 visited:text-purple-600" href="./pages/redirect.jsp">Redirect example</a>
        </div>
    </body>
</html>