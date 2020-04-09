package laplacian.arch.service.api.model


import laplacian.util.*

/**
 * resource_entry
 */
interface ResourceEntry {
    /**
     * The resource_name of this resource_entry.
     */
    val resourceName: String
    /**
     * service
     */
    val service: Service
    /**
     * resource
     */
    val resource: RestResource
}