package laplacian.arch.datasource.gradle
import laplacian.gradle.task.generate.ExecutionContext
import laplacian.gradle.task.generate.ModelEntryResolver
import laplacian.arch.datasource.model.DataAccessList
import laplacian.arch.datasource.record.DataAccessRecord
import laplacian.arch.datasource.model.DatasourceList
import laplacian.arch.datasource.record.DatasourceRecord
import laplacian.util.*

class SchemaDatasourceModelEntryResolver: ModelEntryResolver {

    override fun resolves(key: String, model: Map<String, Any?>): Boolean {
        return arrayOf(
            "data_accesses",
            "datasources"
        ).any { it == key }
    }

    override fun resolve(key: String, model: Map<String, Any?>, context: ExecutionContext): Any? {
        return when (key) {
            "data_accesses" -> DataAccessList(
                model.getList<Record>("data_accesses")
                     .mergeWithKeys("entity_name", "name")
                     .map{ DataAccessRecord(it, context.currentModel) },
                context.currentModel
            )
            "datasources" -> DatasourceList(
                model.getList<Record>("datasources")
                     .mergeWithKeys()
                     .map{ DatasourceRecord(it, context.currentModel) },
                context.currentModel
            )
            else -> throw IllegalArgumentException("Unknown key: $key")
        }
    }
}