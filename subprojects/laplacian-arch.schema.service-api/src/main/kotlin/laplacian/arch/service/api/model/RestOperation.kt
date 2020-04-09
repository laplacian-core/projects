package laplacian.arch.service.api.model

import laplacian.metamodel.model.Entity


import laplacian.util.*

/**
 * rest_operation
 */
interface RestOperation {
    /**
     * The method of this rest_operation.
     */
    val method: String
    /**
     * The path of this rest_operation.
     */
    val path: String
    /**
     * The name of this rest_operation.
     */
    val name: String
    /**
     * The identifier of this rest_operation.
     */
    val identifier: String
    /**
     * The namespace of this rest_operation.
     */
    val namespace: String
    /**
     * The description of this rest_operation.
     */
    val description: String
    /**
     * The response_body_type of this rest_operation.
     */
    val responseBodyType: String
    /**
     * resource
     */
    val resource: RestResource
    /**
     * relating_entities
     */
    val relatingEntities: List<Entity>
        get() = ( pathParameters +
          requestHeaders +
          queryParameters +
          requestBody +
          responseHeaders +
          responseBody
        )
        .flatMap{ it.relatingEntities }
        .distinct()
    /**
     * relating_top_level_entities
     */
    val relatingTopLevelEntities: List<Entity>
        get() = relatingEntities.filter{ it.topLevel }
    /**
     * path_parameters
     */
    val pathParameters: List<RestDataItem>
    /**
     * request_headers
     */
    val requestHeaders: List<RestDataItem>
    /**
     * query_parameters
     */
    val queryParameters: List<RestDataItem>
    /**
     * request_body
     */
    val requestBody: List<RestDataItem>
    /**
     * response_headers
     */
    val responseHeaders: List<RestDataItem>
    /**
     * response_body
     */
    val responseBody: List<RestDataItem>
    /**
     * response_body_root
     */
    val responseBodyRoot: RestDataItem?
        get() = responseBody.find{ it.root }
}