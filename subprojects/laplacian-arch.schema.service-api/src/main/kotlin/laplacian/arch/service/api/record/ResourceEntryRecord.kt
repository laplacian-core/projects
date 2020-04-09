package laplacian.arch.service.api.record
import com.github.jknack.handlebars.Context
import laplacian.arch.service.api.model.ResourceEntry
import laplacian.arch.service.api.model.Service
import laplacian.arch.service.api.model.RestResource
import laplacian.util.*
/**
 * resource_entry
 */
data class ResourceEntryRecord (
    private val __record: Record,
    private val _context: Context,
    override val service: Service,
    private val _record: Record = __record.normalizeCamelcase()
): ResourceEntry, Record by _record {


    /**
     * The resource_name of this resource_entry.
     */
    override val resourceName: String
        get() = getOrThrow("resourceName")

    /**
     * resource
     */
    override val resource: RestResource
        get() = RestResourceRecord.from(_context).find {
            it.name == resourceName
        } ?: throw IllegalStateException(
            "There is no rest_resource which meets the following condition(s): "
            + "ResourceEntry.resource_name == rest_resource.name (=$resourceName) "
            + "Possible values are: " + RestResourceRecord.from(_context).map {
              "(${ it.name })"
            }.joinToString()
        )

    companion object {
        /**
         * creates record list from list of map
         */
        fun from(records: RecordList, _context: Context, service: Service) = records
            .map {
                ResourceEntryRecord(it, _context, service = service)
            }
    }
}