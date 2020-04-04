package laplacian.arch.datasource.model
import com.github.jknack.handlebars.Context

import laplacian.metamodel.model.Entity

import laplacian.util.*

/**
 * A container for records of entity_reference
 */
class EntityReferenceList(
    list: List<EntityReference>,
    val context: Context
) : List<EntityReference> by list {
}