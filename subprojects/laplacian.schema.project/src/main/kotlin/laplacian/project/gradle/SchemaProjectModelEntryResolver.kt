package laplacian.project.gradle
import laplacian.gradle.task.generate.ExecutionContext
import laplacian.gradle.task.generate.ModelEntryResolver
import laplacian.project.model.ProjectList
import laplacian.project.record.ProjectRecord
import laplacian.util.*

class SchemaProjectModelEntryResolver: ModelEntryResolver {

    override fun resolves(key: String, model: Map<String, Any?>): Boolean {
        return arrayOf(
            "project"
        ).any { it == key }
    }

    override fun resolve(key: String, model: Map<String, Any?>, context: ExecutionContext): Any? {
        return when (key) {
            "project" -> model.get("project").let {
                ProjectRecord(it as Map<String, Any?>, context.currentModel)
            }
            else -> throw IllegalArgumentException("Unknown key: $key")
        }
    }
}