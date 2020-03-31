package laplacian.project.record
import com.github.jknack.handlebars.Context
import laplacian.project.model.Module
import laplacian.util.*
/**
 * module
 */
data class ModuleRecord (
    private val __record: Record,
    private val _context: Context,
    private val _record: Record = __record.normalizeCamelcase()
): Module, Record by _record {


    /**
     * The name of this module.
     */
    override val name: String
        get() = getOrThrow("name")

    /**
     * The group of this module.
     */
    override val group: String
        get() = getOrThrow("group")

    /**
     * The version of this module.
     */
    override val version: String
        get() = getOrThrow("version")

    /**
     * The artifact_id of this module.
     */
    override val artifactId: String
        get() = "$group:$group.$name:$version"

    companion object {
        /**
         * creates record list from list of map
         */
        fun from(records: RecordList, _context: Context) = records.map {
            ModuleRecord(it, _context)
        }
    }
}