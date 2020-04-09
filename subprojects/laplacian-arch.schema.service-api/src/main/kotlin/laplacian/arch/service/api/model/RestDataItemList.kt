package laplacian.arch.service.api.model
import com.github.jknack.handlebars.Context

import laplacian.metamodel.model.Entity

import laplacian.util.*

/**
 * A container for records of rest_data_item
 */
class RestDataItemList(
    list: List<RestDataItem>,
    val context: Context
) : List<RestDataItem> by list {
}