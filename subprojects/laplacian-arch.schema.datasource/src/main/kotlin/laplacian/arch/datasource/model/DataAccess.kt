package laplacian.arch.datasource.model

import laplacian.metamodel.model.Entity


import laplacian.util.*

/**
 * data_access
 */
interface DataAccess {
    /**
     * The entity_name of this data_access.
     */
    val entityName: String
    /**
     * The cardinality of this data_access.
     */
    val cardinality: String
    /**
     * Defines this data_access is multiple or not.
     */
    val multiple: Boolean
    /**
     * The type of this data_access.
     */
    val type: String
    /**
     * The name of this data_access.
     */
    val name: String
    /**
     * The identifier of this data_access.
     */
    val identifier: String
    /**
     * The description of this data_access.
     */
    val description: String
    /**
     * The script_type of this data_access.
     */
    val scriptType: String
    /**
     * The script_body of this data_access.
     */
    val scriptBody: String
    /**
     * entity
     */
    val entity: Entity
}