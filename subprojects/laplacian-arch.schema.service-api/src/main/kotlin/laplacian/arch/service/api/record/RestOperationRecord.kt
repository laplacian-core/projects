package laplacian.arch.service.api.record
import com.github.jknack.handlebars.Context
import laplacian.arch.service.api.model.RestOperation
import laplacian.arch.service.api.model.RestResource
import laplacian.metamodel.model.Entity
import laplacian.metamodel.record.EntityRecord
import laplacian.arch.service.api.model.RestDataItem
import laplacian.util.*
/**
 * rest_operation
 */
data class RestOperationRecord (
    private val __record: Record,
    private val _context: Context,
    override val resource: RestResource,
    private val _record: Record = __record.normalizeCamelcase()
): RestOperation, Record by _record {


    /**
     * The method of this rest_operation.
     */
    override val method: String
        get() = getOrThrow("method")

    /**
     * The path of this rest_operation.
     */
    override val path: String
        get() = getOrThrow("path") {
            "/"
        }

    /**
     * The name of this rest_operation.
     */
    override val name: String
        get() = getOrThrow("name") {
            identifier
        }

    /**
     * The identifier of this rest_operation.
     */
    override val identifier: String
        get() = getOrThrow("identifier") {
            method.lowerUnderscorize() + "_" +
            if (path == "/") {
                resource.identifier.pluralize()
            }
            else {
                path.lowerUnderscorize()
            }
        }

    /**
     * The namespace of this rest_operation.
     */
    override val namespace: String
        get() = getOrThrow("namespace") {
            "${resource.namespace}.$identifier"
        }

    /**
     * The description of this rest_operation.
     */
    override val description: String
        get() = getOrThrow("description") {
            name
        }

    /**
     * The response_body_type of this rest_operation.
     */
    override val responseBodyType: String
        get() = responseBodyRoot?.dataType ?:
        ("{" + responseBody.joinToString(",\n"){ it.dataType } + "}")

    /**
     * path_parameters
     */
    override val pathParameters: List<RestDataItem>
        = RestDataItemRecord.from(_record.getList("path_parameters", emptyList()), _context)

    /**
     * request_headers
     */
    override val requestHeaders: List<RestDataItem>
        = RestDataItemRecord.from(_record.getList("request_headers", emptyList()), _context)

    /**
     * query_parameters
     */
    override val queryParameters: List<RestDataItem>
        = RestDataItemRecord.from(_record.getList("query_parameters", emptyList()), _context)

    /**
     * request_body
     */
    override val requestBody: List<RestDataItem>
        = RestDataItemRecord.from(_record.getList("request_body", emptyList()), _context)

    /**
     * response_headers
     */
    override val responseHeaders: List<RestDataItem>
        = RestDataItemRecord.from(_record.getList("response_headers", emptyList()), _context)

    /**
     * response_body
     */
    override val responseBody: List<RestDataItem>
        = RestDataItemRecord.from(_record.getList("response_body", emptyList()), _context)

    companion object {
        /**
         * creates record list from list of map
         */
        fun from(records: RecordList, _context: Context, resource: RestResource) = records
            .map {
                RestOperationRecord(it, _context, resource = resource)
            }
    }
}