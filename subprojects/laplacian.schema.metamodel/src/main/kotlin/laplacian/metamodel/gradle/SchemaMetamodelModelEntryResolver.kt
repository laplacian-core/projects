package laplacian.metamodel.gradle
import laplacian.gradle.task.generate.ExecutionContext
import laplacian.gradle.task.generate.ModelEntryResolver
import laplacian.metamodel.model.EntityList
import laplacian.metamodel.record.EntityRecord
import laplacian.metamodel.model.ValueDomainTypeList
import laplacian.metamodel.record.ValueDomainTypeRecord
import laplacian.util.*

class SchemaMetamodelModelEntryResolver: ModelEntryResolver {

    override fun resolves(key: String, model: Map<String, Any?>): Boolean {
        return arrayOf(
            "entities",
            "value_domain_types"
        ).any { it == key }
    }

    override fun resolve(key: String, model: Map<String, Any?>, context: ExecutionContext): Any? {
        return when (key) {
            "entities" -> EntityList(
                model.getList<Record>("entities", emptyList())
                     .mergeWithKeys("name", "namespace")
                     .map{ EntityRecord(it, context.currentModel) },
                context.currentModel
            )
            "value_domain_types" -> ValueDomainTypeList(
                model.getList<Record>("value_domain_types", emptyList())
                     .mergeWithKeys()
                     .map{ ValueDomainTypeRecord(it, context.currentModel) },
                context.currentModel
            )
            else -> throw IllegalArgumentException("Unknown key: $key")
        }
    }
}