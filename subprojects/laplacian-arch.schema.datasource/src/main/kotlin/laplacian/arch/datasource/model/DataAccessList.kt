package laplacian.arch.datasource.model
import com.github.jknack.handlebars.Context

import laplacian.metamodel.model.Entity

import laplacian.util.*

/**
 * A container for records of data_access
 */
class DataAccessList(
    list: List<DataAccess>,
    val context: Context
) : List<DataAccess> by list {
    /**
     * contains_jooq_scripts
     */
    val containsJooqScripts: Boolean
        get() = any{ it.scriptType.contains("jooq") }
}