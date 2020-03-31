package laplacian.project.record
import com.github.jknack.handlebars.Context
import laplacian.project.model.SourceRepository
import laplacian.util.*
/**
 * source_repository
 */
data class SourceRepositoryRecord (
    private val __record: Record,
    private val _context: Context,
    private val _record: Record = __record.normalizeCamelcase()
): SourceRepository, Record by _record {


    /**
     * The url of this source_repository.
     */
    override val url: String
        get() = getOrThrow("url")

    /**
     * The branch of this source_repository.
     */
    override val branch: String
        get() = getOrThrow("branch") {
            "master"
        }

    companion object {
        /**
         * creates record list from list of map
         */
        fun from(records: RecordList, _context: Context) = records.map {
            SourceRepositoryRecord(it, _context)
        }
    }
}