#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%-- //[START all]--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<%-- //[START imports]--%>
<%@ page import="com.example.guestbook.Greeting" %>
<%@ page import="com.example.guestbook.Guestbook" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%-- //[END imports]--%>

<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
</head>

<body>

<%
    String guestbookName = request.getParameter("guestbookName");
    if (guestbookName == null) {
        guestbookName = "default";
    }
    pageContext.setAttribute("guestbookName", guestbookName);
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
        pageContext.setAttribute("user", user);
%>

<p>Hello, ${symbol_dollar}{fn:escapeXml(user.nickname)}! (You can
    <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
    } else {
%>
<p>Hello!
    <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
    to include your name with greetings you post.</p>
<%
    }
%>

<%-- //[START datastore]--%>
<%
    // Create the correct Ancestor key
      Key<Guestbook> theBook = Key.create(Guestbook.class, guestbookName);

    // Run an ancestor query to ensure we see the most up-to-date
    // view of the Greetings belonging to the selected Guestbook.
      List<Greeting> greetings = ObjectifyService.ofy()
          .load()
          .type(Greeting.class) // We want only Greetings
          .ancestor(theBook)    // Anyone in this book
          .order("-date")       // Most recent first - date is indexed.
          .limit(5)             // Only show 5 of them.
          .list();

    if (greetings.isEmpty()) {
%>
<p>Guestbook '${symbol_dollar}{fn:escapeXml(guestbookName)}' has no messages.</p>
<%
    } else {
%>
<p>Messages in Guestbook '${symbol_dollar}{fn:escapeXml(guestbookName)}'.</p>
<%
      // Look at all of our greetings
        for (Greeting greeting : greetings) {
            pageContext.setAttribute("greeting_content", greeting.content);
            String author;
            if (greeting.author_email == null) {
                author = "An anonymous person";
            } else {
                author = greeting.author_email;
                String author_id = greeting.author_id;
                if (user != null && user.getUserId().equals(author_id)) {
                    author += " (You)";
                }
            }
            pageContext.setAttribute("greeting_user", author);
%>
<p><b>${symbol_dollar}{fn:escapeXml(greeting_user)}</b> wrote:</p>
<blockquote>${symbol_dollar}{fn:escapeXml(greeting_content)}</blockquote>
<%
        }
    }
%>

<form action="/sign" method="post">
    <div><textarea name="content" rows="3" cols="60"></textarea></div>
    <div><input type="submit" value="Post Greeting"/></div>
    <input type="hidden" name="guestbookName" value="${symbol_dollar}{fn:escapeXml(guestbookName)}"/>
</form>
<%-- //[END datastore]--%>
<form action="/guestbook.jsp" method="get">
    <div><input type="text" name="guestbookName" value="${symbol_dollar}{fn:escapeXml(guestbookName)}"/></div>
    <div><input type="submit" value="Switch Guestbook"/></div>
</form>

</body>
</html>
<%-- //[END all]--%>
