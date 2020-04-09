package laplacian.arch.service.api.model

import laplacian.metamodel.model.Entity


import laplacian.util.*

/**
 * graphql_query
 */
interface GraphqlQuery {
    /**
     * The name of this graphql_query.
     */
    val name: String
    /**
     * The identifier of this graphql_query.
     */
    val identifier: String
    /**
     * The description of this graphql_query.
     */
    val description: String
    /**
     * The query of this graphql_query.
     */
    val query: String
    /**
     * Defines this graphql_query is multiple or not.
     */
    val multiple: Boolean
    /**
     * The record_entity_name of this graphql_query.
     */
    val recordEntityName: String?
    /**
     * The record_type of this graphql_query.
     */
    val recordType: String
    /**
     * The return_type of this graphql_query.
     */
    val returnType: String
    /**
     * service
     */
    val service: Service
    /**
     * record_entity
     */
    val recordEntity: Entity?
}