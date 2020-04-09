package laplacian.arch.service.api.record
import com.github.jknack.handlebars.Context
import laplacian.arch.service.api.model.GraphqlQuery
import laplacian.arch.service.api.model.Service
import laplacian.metamodel.model.Entity
import laplacian.metamodel.record.EntityRecord
import laplacian.util.*
/**
 * graphql_query
 */
data class GraphqlQueryRecord (
    private val __record: Record,
    private val _context: Context,
    override val service: Service,
    private val _record: Record = __record.normalizeCamelcase()
): GraphqlQuery, Record by _record {


    /**
     * The name of this graphql_query.
     */
    override val name: String
        get() = getOrThrow("name")

    /**
     * The identifier of this graphql_query.
     */
    override val identifier: String
        get() = getOrThrow("identifier") {
            name.lowerUnderscorize()
        }

    /**
     * The description of this graphql_query.
     */
    override val description: String
        get() = getOrThrow("description") {
            "$name query."
        }

    /**
     * The query of this graphql_query.
     */
    override val query: String
        get() = getOrThrow("query")

    /**
     * Defines this graphql_query is multiple or not.
     */
    override val multiple: Boolean
        get() = getOrThrow("multiple") {
            false
        }

    /**
     * The record_entity_name of this graphql_query.
     */
    override val recordEntityName: String? by _record

    /**
     * The record_type of this graphql_query.
     */
    override val recordType: String
        get() = getOrThrow("recordType") {
            recordEntity?.className ?: throw IllegalStateException(
                "It is needed to define record_type or record_entity_name."
            )
        }

    /**
     * The return_type of this graphql_query.
     */
    override val returnType: String
        get() = getOrThrow("returnType") {
            recordType + if (multiple) "[]" else ""
        }

    /**
     * record_entity
     */
    override val recordEntity: Entity?
        get() = EntityRecord.from(_context).find {
            it.name == recordEntityName
        }

    companion object {
        /**
         * creates record list from list of map
         */
        fun from(records: RecordList, _context: Context, service: Service) = records
            .map {
                GraphqlQueryRecord(it, _context, service = service)
            }
    }
}