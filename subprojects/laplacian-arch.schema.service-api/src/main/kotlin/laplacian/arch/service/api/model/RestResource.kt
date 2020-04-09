package laplacian.arch.service.api.model

import laplacian.metamodel.model.Entity


import laplacian.util.*

/**
 * rest_resource
 */
interface RestResource {
    /**
     * The name of this rest_resource.
     */
    val name: String
    /**
     * The identifier of this rest_resource.
     */
    val identifier: String
    /**
     * The namespace of this rest_resource.
     */
    val namespace: String
    /**
     * The path of this rest_resource.
     */
    val path: String
    /**
     * The description of this rest_resource.
     */
    val description: String
    /**
     * operations
     */
    val operations: List<RestOperation>
    /**
     * relating_entities
     */
    val relatingEntities: List<Entity>
        get() = operations
        .flatMap{ it.relatingEntities }
        .distinct()
    /**
     * relating_top_level_entities
     */
    val relatingTopLevelEntities: List<Entity>
        get() = relatingEntities.filter{ it.topLevel }
}