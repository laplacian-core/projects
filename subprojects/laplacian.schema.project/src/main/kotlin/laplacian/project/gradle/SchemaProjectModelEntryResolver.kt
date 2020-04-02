package laplacian.project.gradle
import laplacian.gradle.task.generate.ExecutionContext
import laplacian.gradle.task.generate.ModelEntryResolver
import laplacian.project.model.ProjectList
import laplacian.project.record.ProjectRecord
import laplacian.util.*

class SchemaProjectModelEntryResolver: ModelEntryResolver {

    override fun resolves(key: String, model: Map<String, RecordList>): Boolean {
        return arrayOf(
            "projects"
        ).any { it == key }
    }

    override fun resolve(key: String, model: Map<String, RecordList>, context: ExecutionContext): Any? {
        return when (key) {
            "projects" -> ProjectList(
                model.getList<Record>("projects")
                     .mergeWithKeys("group", "name")
                     .map{ ProjectRecord(it, context.currentModel) },
                context.currentModel
            )
            else -> throw IllegalArgumentException("Unknown key: $key")
        }
    }
}