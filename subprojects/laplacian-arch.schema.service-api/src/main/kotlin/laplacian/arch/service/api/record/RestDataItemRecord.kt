package laplacian.arch.service.api.record
import com.github.jknack.handlebars.Context
import laplacian.arch.service.api.model.RestDataItem
import laplacian.arch.service.api.model.RestDataItemList
import laplacian.metamodel.model.Entity
import laplacian.metamodel.record.EntityRecord
import laplacian.util.*
/**
 * rest_data_item
 */
data class RestDataItemRecord (
    private val __record: Record,
    private val _context: Context,
    override val parent: RestDataItem? = null,
    private val _record: Record = __record.normalizeCamelcase()
): RestDataItem, Record by _record {


    /**
     * The name of this rest_data_item.
     */
    override val name: String
        get() = getOrThrow("name")

    /**
     * The identifier of this rest_data_item.
     */
    override val identifier: String
        get() = getOrThrow("identifier") {
            name.lowerUnderscorize()
        }

    /**
     * The type of this rest_data_item.
     */
    override val type: String? by _record

    /**
     * The data_type of this rest_data_item.
     */
    override val dataType: String
        get() = (
            type ?:
            entity?.className ?:
            "{" + children.joinToString(",\n"){ it.dataType } + "}"
        ) + (if (multiple) "[]" else "")

    /**
     * The entity_name of this rest_data_item.
     */
    override val entityName: String? by _record

    /**
     * The description of this rest_data_item.
     */
    override val description: String
        get() = getOrThrow("description") {
            name
        }

    /**
     * Defines this rest_data_item is root or not.
     */
    override val root: Boolean
        get() = getOrThrow("root") {
            false
        }

    /**
     * Defines this rest_data_item is multiple or not.
     */
    override val multiple: Boolean
        get() = getOrThrow("multiple") {
            false
        }

    /**
     * Defines this rest_data_item is required or not.
     */
    override val required: Boolean
        get() = getOrThrow("required") {
            false
        }

    /**
     * The default_value of this rest_data_item.
     */
    override val defaultValue: String? by _record

    /**
     * The example_value of this rest_data_item.
     */
    override val exampleValue: String
        get() = getOrThrow("exampleValue") {
            defaultValue ?: when (type) {
              "boolean" -> "false"
              "number" -> "42"
              "string" -> "\"hogehoge\""
              else -> "null"
            }
        }

    /**
     * children
     */
    override val children: List<RestDataItem>
        = RestDataItemRecord.from(_record.getList("children", emptyList()), _context, this)

    /**
     * entity
     */
    override val entity: Entity?
        get() = EntityRecord.from(_context).find {
            it.name == entityName
        }

    companion object {
        /**
         * creates record list from list of map
         */
        fun from(_context: Context): RestDataItemList {
            return _context.get("rest_data_items") as RestDataItemList
        }
        fun from(records: RecordList, _context: Context, parent: RestDataItem? = null) = records
            .map {
                RestDataItemRecord(it, _context, parent = parent)
            }
    }
}