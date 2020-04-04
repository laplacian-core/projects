package laplacian.arch.datasource.record
import com.github.jknack.handlebars.Context
import laplacian.arch.datasource.model.Datasource
import laplacian.arch.datasource.model.DatasourceList
import laplacian.arch.datasource.model.EntityReference
import laplacian.metamodel.model.Entity
import laplacian.metamodel.record.EntityRecord
import laplacian.util.*
/**
 * datasource
 */
data class DatasourceRecord (
    private val __record: Record,
    private val _context: Context,
    private val _record: Record = __record.normalizeCamelcase()
): Datasource, Record by _record {


    /**
     * The name of this datasource.
     */
    override val name: String
        get() = getOrThrow("name")

    /**
     * The type of this datasource.
     */
    override val type: String
        get() = getOrThrow("type")

    /**
     * The identifier of this datasource.
     */
    override val identifier: String
        get() = getOrThrow("identifier") {
            name.lowerUnderscorize()
        }

    /**
     * The description of this datasource.
     */
    override val description: String
        get() = getOrThrow("description") {
            name
        }

    /**
     * The hostname of this datasource.
     */
    override val hostname: String
        get() = getOrThrow("hostname") {
            containerName
        }

    /**
     * The port of this datasource.
     */
    override val port: Int
        get() = getOrThrow("port") {
            5432
        }

    /**
     * The jdbc_url of this datasource.
     */
    override val jdbcUrl: String
        get() = getOrThrow("jdbcUrl") {
            if (type == "postgres") {
                "jdbc:postgresql://$hostname:$port/$dbname"
            }
            else {
                throw IllegalStateException(
                    "Unknown database type: $type"
                )
            }
        }

    /**
     * The dbname of this datasource.
     */
    override val dbname: String
        get() = getOrThrow("dbname") {
            user
        }

    /**
     * The user of this datasource.
     */
    override val user: String
        get() = getOrThrow("user")

    /**
     * The password of this datasource.
     */
    override val password: String? by _record

    /**
     * The container_name of this datasource.
     */
    override val containerName: String
        get() = getOrThrow("containerName") {
            "${identifier.lowerHyphenize()}"
        }

    /**
     * The container_image of this datasource.
     */
    override val containerImage: String
        get() = getOrThrow("containerImage") {
            when(type) {
              "postgresql" -> "postgres"
              else -> "postgres"
            }
        }

    /**
     * entity_references
     */
    override val entityReferences: List<EntityReference>
        = EntityReferenceRecord.from(_record.getList("entity_references", emptyList()), _context, this)

    companion object {
        /**
         * creates record list from list of map
         */
        fun from(_context: Context): DatasourceList {
            return _context.get("datasources") as DatasourceList
        }
        fun from(records: RecordList, _context: Context) = records.map {
            DatasourceRecord(it, _context)
        }
    }
}