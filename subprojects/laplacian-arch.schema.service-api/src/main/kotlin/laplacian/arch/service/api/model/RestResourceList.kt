package laplacian.arch.service.api.model
import com.github.jknack.handlebars.Context

import laplacian.metamodel.model.Entity

import laplacian.util.*

/**
 * A container for records of rest_resource
 */
class RestResourceList(
    list: List<RestResource>,
    val context: Context
) : List<RestResource> by list {
    val inNamespace: List<RestResource>
        get() = filter {
            it.namespace.startsWith(context.get("project.namespace") as String)
        }
}