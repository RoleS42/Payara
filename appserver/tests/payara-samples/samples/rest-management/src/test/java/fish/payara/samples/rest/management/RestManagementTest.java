/*
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
 *
 * Copyright (c) [2020] Payara Foundation and/or its affiliates. All rights reserved.
 *
 * The contents of this file are subject to the terms of either the GNU
 * General Public License Version 2 only ("GPL") or the Common Development
 * and Distribution License("CDDL") (collectively, the "License").  You
 * may not use this file except in compliance with the License.  You can
 * obtain a copy of the License at
 * https://github.com/payara/Payara/blob/master/LICENSE.txt
 * See the License for the specific
 * language governing permissions and limitations under the License.
 *
 * When distributing the software, include this License Header Notice in each
 * file and include the License file at glassfish/legal/LICENSE.txt.
 *
 * GPL Classpath Exception:
 * The Payara Foundation designates this particular file as subject to the "Classpath"
 * exception as provided by the Payara Foundation in the GPL Version 2 section of the License
 * file that accompanied this code.
 *
 * Modifications:
 * If applicable, add the following below the License Header, with the fields
 * enclosed by brackets [] replaced by your own identifying information:
 * "Portions Copyright [year] [name of copyright owner]"
 *
 * Contributor(s):
 * If you wish your version of this file to be governed by only the CDDL or
 * only the GPL Version 2, indicate your decision by adding "[Contributor]
 * elects to include this software in this distribution under the [CDDL or GPL
 * Version 2] license."  If you don't indicate a single choice of license, a
 * recipient has the option to distribute your version of this file under
 * either the CDDL, the GPL Version 2 or to extend the choice of license to
 * its licensees as provided above.  However, if you add GPL Version 2 code
 * and therefore, elected the GPL Version 2 license, then the option applies
 * only if the new code is made subject to such option by the copyright
 * holder.
 */
package fish.payara.samples.rest.management;

import static org.junit.Assert.assertNotNull;

import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Response;

import com.gargoylesoftware.htmlunit.HttpMethod;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.test.api.ArquillianResource;
import org.jboss.shrinkwrap.api.Archive;
import org.junit.Before;
import org.junit.runner.RunWith;

import fish.payara.samples.PayaraArquillianTestRunner;
import fish.payara.samples.PayaraTestShrinkWrap;
import fish.payara.samples.ServerOperations;

@RunWith(PayaraArquillianTestRunner.class)
public abstract class RestManagementTest {

    private WebTarget target;

    @ArquillianResource
    private URL baseUrl;

    @Deployment(testable = false)
    public static Archive<?> deploy() {
        return PayaraTestShrinkWrap.getWebArchive()
            .addClass(RestManagementTest.class);
    }

    @Before
    public final void setUpFields() throws URISyntaxException {
        URI adminBaseUrl = ServerOperations.toAdminPort(baseUrl).toURI();
        assertNotNull("Something went wrong with the test, and an admin port cannot be found.", adminBaseUrl);
        target = ClientBuilder
            .newClient()
            .target(adminBaseUrl.resolve("/management/domain/").toString());
    }

    /**
     * Make a synchronous request to the REST management interface.
     * 
     * @param method the HTTP method to use for the request
     * @param path   the path of the request, relative to /management/domain/
     * @param entity the entity to send in the request
     * 
     * @return the response of the request.
     */
    protected Response request(HttpMethod method, String path, Entity<?> entity) {
        return target
            .path(path)
            .request()
            .header("X-Requested-By", "Payara")
            .build(method.toString(), entity)
            .invoke();
    }


    /**
     * Make a synchronous request to the REST management interface. This method
     * sends nothing in the body. To send data, see
     * {@link #request(HttpMethod, String, Entity)}.
     * 
     * @param method the HTTP method to use for the request
     * @param path   the path of the request, relative to /management/domain/
     * 
     * @return the response of the request.
     */
    protected Response request(HttpMethod method, String path) {
        return request(method, path, null);
    }
}