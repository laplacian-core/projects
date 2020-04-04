package laplacian.arch.datasource.model
import com.github.jknack.handlebars.Context

import laplacian.metamodel.model.Entity

import laplacian.util.*

/**
 * A container for records of datasource
 */
class DatasourceList(
    list: List<Datasource>,
    val context: Context
) : List<Datasource> by list {
}