package laplacian.arch.service.api.model

import laplacian.arch.datasource.model.Datasource

import laplacian.metamodel.model.Entity


import laplacian.util.*

/**
 * service
 */
interface Service {
    /**
     * The name of this service.
     */
    val name: String
    /**
     * The identifier of this service.
     */
    val identifier: String
    /**
     * The version of this service.
     */
    val version: String
    /**
     * The api_version of this service.
     */
    val apiVersion: String
    /**
     * The endpoint of this service.
     */
    val endpoint: String
    /**
     * The host of this service.
     */
    val host: String
    /**
     * The port of this service.
     */
    val port: Int
    /**
     * The protocol of this service.
     */
    val protocol: String
    /**
     * The path of this service.
     */
    val path: String
    /**
     * The namespace of this service.
     */
    val namespace: String
    /**
     * The description of this service.
     */
    val description: String
    /**
     * The datasource_name of this service.
     */
    val datasourceName: String
    /**
     * resource_entries
     */
    val resourceEntries: List<ResourceEntry>
    /**
     * resources
     */
    val resources: List<RestResource>
        get() = resourceEntries.map{ it.resource }
    /**
     * datasource
     */
    val datasource: Datasource
    /**
     * relating_entities
     */
    val relatingEntities: List<Entity>
        get() = resources
        .flatMap{ it.relatingEntities }
        .distinctBy{ it.fqn }
    /**
     * relating_top_level_entities
     */
    val relatingTopLevelEntities: List<Entity>
        get() = relatingEntities
        .filter{ it.topLevel }
    /**
     * graphql_queries
     */
    val graphqlQueries: List<GraphqlQuery>
}