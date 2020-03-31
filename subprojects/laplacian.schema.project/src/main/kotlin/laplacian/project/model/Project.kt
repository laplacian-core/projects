package laplacian.project.model


import laplacian.util.*

/**
 * project
 */
interface Project {
    /**
     * The group of this project.
     */
    val group: String
    /**
     * The name of this project.
     */
    val name: String
    /**
     * The type of this project.
     */
    val type: String
    /**
     * The version of this project.
     */
    val version: String
    /**
     * The namespace of this project.
     */
    val namespace: String
    /**
     * The description of this project.
     */
    val description: String
    /**
     * The base_dir of this project.
     */
    val baseDir: String
    /**
     * parent_project
     */
    val parentProject: Project?
    /**
     * subprojects
     */
    val subprojects: List<Project>
    /**
     * source_repository
     */
    val sourceRepository: SourceRepository?
    /**
     * models
     */
    val models: List<Module>
    /**
     * templates
     */
    val templates: List<Module>
    /**
     * schemas
     */
    val schemas: List<Module>
}