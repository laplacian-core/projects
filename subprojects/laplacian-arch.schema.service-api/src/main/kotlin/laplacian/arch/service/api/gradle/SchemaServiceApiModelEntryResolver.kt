package laplacian.arch.service.api.gradle
import laplacian.gradle.task.generate.ExecutionContext
import laplacian.gradle.task.generate.ModelEntryResolver
import laplacian.arch.service.api.model.RestDataItemList
import laplacian.arch.service.api.record.RestDataItemRecord
import laplacian.arch.service.api.model.RestResourceList
import laplacian.arch.service.api.record.RestResourceRecord
import laplacian.arch.service.api.model.ServiceList
import laplacian.arch.service.api.record.ServiceRecord
import laplacian.util.*

class SchemaServiceApiModelEntryResolver: ModelEntryResolver {

    override fun resolves(key: String, model: Map<String, Any?>): Boolean {
        return arrayOf(
            "rest_data_items",
            "rest_resources",
            "services"
        ).any { it == key }
    }

    override fun resolve(key: String, model: Map<String, Any?>, context: ExecutionContext): Any? {
        return when (key) {
            "rest_data_items" -> RestDataItemList(
                model.getList<Record>("rest_data_items")
                     .mergeWithKeys()
                     .map{ RestDataItemRecord(it, context.currentModel) },
                context.currentModel
            )
            "rest_resources" -> RestResourceList(
                model.getList<Record>("rest_resources")
                     .mergeWithKeys()
                     .map{ RestResourceRecord(it, context.currentModel) },
                context.currentModel
            )
            "services" -> ServiceList(
                model.getList<Record>("services")
                     .mergeWithKeys()
                     .map{ ServiceRecord(it, context.currentModel) },
                context.currentModel
            )
            else -> throw IllegalArgumentException("Unknown key: $key")
        }
    }
}