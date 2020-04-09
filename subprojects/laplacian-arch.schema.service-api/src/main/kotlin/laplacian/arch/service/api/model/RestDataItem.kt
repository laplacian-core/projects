package laplacian.arch.service.api.model

import laplacian.metamodel.model.Entity


import laplacian.util.*

/**
 * rest_data_item
 */
interface RestDataItem {
    /**
     * The name of this rest_data_item.
     */
    val name: String
    /**
     * The identifier of this rest_data_item.
     */
    val identifier: String
    /**
     * The type of this rest_data_item.
     */
    val type: String?
    /**
     * The data_type of this rest_data_item.
     */
    val dataType: String
    /**
     * The entity_name of this rest_data_item.
     */
    val entityName: String?
    /**
     * The description of this rest_data_item.
     */
    val description: String
    /**
     * Defines this rest_data_item is root or not.
     */
    val root: Boolean
    /**
     * Defines this rest_data_item is multiple or not.
     */
    val multiple: Boolean
    /**
     * Defines this rest_data_item is required or not.
     */
    val required: Boolean
    /**
     * The default_value of this rest_data_item.
     */
    val defaultValue: String?
    /**
     * The example_value of this rest_data_item.
     */
    val exampleValue: String
    /**
     * children
     */
    val children: List<RestDataItem>
    /**
     * parent
     */
    val parent: RestDataItem?
    /**
     * entity
     */
    val entity: Entity?
    /**
     * relating_entities
     */
    val relatingEntities: List<Entity>
        get() = children.flatMap{ it.relatingEntities }.let {
            if (entity == null) {
                it
            } else {
                it + listOf(entity!!) + entity!!.relatingEntities
            }
        }.distinct()
}