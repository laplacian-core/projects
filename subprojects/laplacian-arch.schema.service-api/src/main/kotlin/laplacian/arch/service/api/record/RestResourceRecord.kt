package laplacian.arch.service.api.record
import com.github.jknack.handlebars.Context
import laplacian.arch.service.api.model.RestResource
import laplacian.arch.service.api.model.RestResourceList
import laplacian.arch.service.api.model.RestOperation
import laplacian.metamodel.model.Entity
import laplacian.metamodel.record.EntityRecord
import laplacian.util.*
/**
 * rest_resource
 */
data class RestResourceRecord (
    private val __record: Record,
    private val _context: Context,
    private val _record: Record = __record.normalizeCamelcase()
): RestResource, Record by _record {


    /**
     * The name of this rest_resource.
     */
    override val name: String
        get() = getOrThrow("name")

    /**
     * The identifier of this rest_resource.
     */
    override val identifier: String
        get() = getOrThrow("identifier") {
            name.lowerUnderscorize()
        }

    /**
     * The namespace of this rest_resource.
     */
    override val namespace: String
        get() = getOrThrow("namespace") {
            "${_context.get("project.namespace")}.resource.$identifier"
        }

    /**
     * The path of this rest_resource.
     */
    override val path: String
        get() = getOrThrow("path") {
            "/${identifier.lowerUnderscorize()}"
        }

    /**
     * The description of this rest_resource.
     */
    override val description: String
        get() = getOrThrow("description") {
            name
        }

    /**
     * operations
     */
    override val operations: List<RestOperation>
        = RestOperationRecord.from(_record.getList("operations"), _context, this)

    companion object {
        /**
         * creates record list from list of map
         */
        fun from(_context: Context): RestResourceList {
            return _context.get("rest_resources") as RestResourceList
        }
        fun from(records: RecordList, _context: Context) = records.map {
            RestResourceRecord(it, _context)
        }
    }
}