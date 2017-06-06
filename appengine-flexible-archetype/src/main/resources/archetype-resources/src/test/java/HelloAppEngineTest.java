##  Copyright 2016 Google Inc.
##
##  Licensed under the Apache License, Version 2.0 (the "License");
##  you may not use this file except in compliance with the License.
##  You may obtain a copy of the License at
##
##       http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.
#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package};

import static com.google.common.truth.Truth.assertThat;
import static org.mockito.Mockito.when;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Unit tests for {@link HelloAppEngine}.
 */

@RunWith(JUnit4.class)
public class HelloAppEngineTest {
  private static final String FAKE_URL = "fake.fk/hello";

  @Mock private HttpServletRequest mockRequest;
  @Mock private HttpServletResponse mockResponse;
  private StringWriter responseWriter;
  private HelloAppEngine servletUnderTest;

  @Before
  public void setUp() throws Exception {
    MockitoAnnotations.initMocks(this);

    //  Set up some fake HTTP requests
    when(mockRequest.getRequestURI()).thenReturn(FAKE_URL);

    // Set up a fake HTTP response.
    responseWriter = new StringWriter();
    when(mockResponse.getWriter()).thenReturn(new PrintWriter(responseWriter));

    servletUnderTest = new HelloAppEngine();
  }

  @Test
  public void doGet_writesResponse() throws Exception {
    servletUnderTest.doGet(mockRequest, mockResponse);

    // We expect our hello world response.
    assertThat(responseWriter.toString())
        .named("HelloAppEngine response")
        .contains("Hello App Engine - Flexible!");
  }

  @Test
  public void HelloAppEngine_test() {
    String result = HelloAppEngine.getInfo();
    assertThat(result)
      .named("HelloAppEngine.getInfo")
      .containsMatch("^Version:\\s+.+OS:\\s+.+User:\\s");
  }
}
