package laplacian.project.model


import laplacian.util.*

/**
 * module
 */
interface Module {
    /**
     * The name of this module.
     */
    val name: String
    /**
     * The group of this module.
     */
    val group: String
    /**
     * The version of this module.
     */
    val version: String
    /**
     * The artifact_id of this module.
     */
    val artifactId: String
}