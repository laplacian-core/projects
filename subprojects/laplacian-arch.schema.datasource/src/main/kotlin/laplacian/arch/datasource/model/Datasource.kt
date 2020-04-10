package laplacian.arch.datasource.model

import laplacian.metamodel.model.Entity


import laplacian.util.*

/**
 * A *DataSource* represents a connection to a data store, such as an RDBMS.

 */
interface Datasource {
    /**
     * The name of this datasource.
     */
    val name: String
    /**
     * The type of this datasource.
     */
    val type: String
    /**
     * The identifier of this datasource.
     */
    val identifier: String
    /**
     * The description of this datasource.
     */
    val description: String
    /**
     * The hostname of this datasource.
     */
    val hostname: String
    /**
     * The port of this datasource.
     */
    val port: Int
    /**
     * The jdbc_url of this datasource.
     */
    val jdbcUrl: String
    /**
     * The dbname of this datasource.
     */
    val dbname: String
    /**
     * The user of this datasource.
     */
    val user: String
    /**
     * The password of this datasource.
     */
    val password: String?
    /**
     * The container_name of this datasource.
     */
    val containerName: String
    /**
     * The container_image of this datasource.
     */
    val containerImage: String
    /**
     * entity_references
     */
    val entityReferences: List<EntityReference>
    /**
     * entities
     */
    val entities: List<Entity>
        get() = entityReferences.map{ it.entity }
    /**
     * top_level_entities
     */
    val topLevelEntities: List<Entity>
        get() = entities.filter{ it.topLevel }
}