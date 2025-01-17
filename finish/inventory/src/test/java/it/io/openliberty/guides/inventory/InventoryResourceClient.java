// tag::copyright[]
/*******************************************************************************
 * Copyright (c) 2024 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License 2.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *******************************************************************************/
// end::copyright[]
package it.io.openliberty.guides.inventory;

import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/inventory")
public interface InventoryResourceClient {

    // tag::getSystems[]
    @GET
    @Path("/systems")
    @Produces(MediaType.APPLICATION_JSON)
    Response getSystems();
    // end::getSystems[]

    // tag::resetSystems[]
    @DELETE
    @Produces(MediaType.APPLICATION_JSON)
    Response resetSystems();
    // end::resetSystems[]

}
