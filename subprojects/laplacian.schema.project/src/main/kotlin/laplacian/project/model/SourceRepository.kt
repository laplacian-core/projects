package laplacian.project.model


import laplacian.util.*

/**
 * source_repository
 */
interface SourceRepository {
    /**
     * The url of this source_repository.
     */
    val url: String
    /**
     * The branch of this source_repository.
     */
    val branch: String
}