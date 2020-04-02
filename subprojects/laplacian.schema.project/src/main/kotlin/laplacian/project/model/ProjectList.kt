package laplacian.project.model
import com.github.jknack.handlebars.Context

import laplacian.util.*

/**
 * A container for records of project
 */
class ProjectList(
    list: List<Project>,
    val context: Context
) : List<Project> by list {
    val inNamespace: List<Project>
        get() = filter {
            it.namespace.startsWith(context.get("project.namespace") as String)
        }
}