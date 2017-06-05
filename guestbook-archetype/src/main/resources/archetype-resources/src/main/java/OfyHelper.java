## Copyright 2017 Google Inc.
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package};

import com.googlecode.objectify.ObjectifyService;

#if ( $java8 == "true" )
import javax.servlet.annotation.WebListener;
#end
import javax.servlet.ServletContext;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;

/**
 * OfyHelper, a ServletContextListener, is setup in web.xml to run before a JSP is run.  This is
 * required to let JSP's access Ofy.
 **/
#if ( $java8 == "true" )
@WebListener
#end
public class OfyHelper implements ServletContextListener {
  public static void register() {
    ObjectifyService.register(Guestbook.class);
    ObjectifyService.register(Greeting.class);
  }

  public void contextInitialized(ServletContextEvent event) {
    ServletContext sc = event.getServletContext();
    sc.log("OfyHelper: Init");
    // This will be invoked as part of a warmup request, or the first user
    // request if no warmup request was invoked.
    register();
  }

  public void contextDestroyed(ServletContextEvent event) {
    // App Engine does not currently invoke this method.
  }
}
