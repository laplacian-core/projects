package laplacian.project.record
import com.github.jknack.handlebars.Context
import laplacian.project.model.Project
import laplacian.project.model.ProjectList
import laplacian.project.model.SourceRepository
import laplacian.project.model.Module
import laplacian.util.*
/**
 * project
 */
data class ProjectRecord (
    private val __record: Record,
    private val _context: Context,
    override val parentProject: Project? = null,
    private val _record: Record = __record.normalizeCamelcase()
): Project, Record by _record {


    /**
     * The group of this project.
     */
    override val group: String
        get() = getOrThrow("group")

    /**
     * The name of this project.
     */
    override val name: String
        get() = getOrThrow("name")

    /**
     * The type of this project.
     */
    override val type: String
        get() = getOrThrow("type") {
            "generator"
        }

    /**
     * The version of this project.
     */
    override val version: String
        get() = getOrThrow("version")

    /**
     * The namespace of this project.
     */
    override val namespace: String
        get() = getOrThrow("namespace") {
            listOf(group, name)
                .map{ it.lowerUnderscorize() }
                .joinToString(".")
        }

    /**
     * The description of this project.
     */
    override val description: String
        get() = getOrThrow("description") {
            "${group}:${name}"
        }

    /**
     * The base_dir of this project.
     */
    override val baseDir: String
        get() = getOrThrow("baseDir") {
            "subprojects/${group}.${name}"
        }

    /**
     * subprojects
     */
    override val subprojects: List<Project>
        = ProjectRecord.from(_record.getList("subprojects", emptyList()), _context, this)

    /**
     * source_repository
     */
    override val sourceRepository: SourceRepository?
        = getOrNull<Record>("source_repository")?.let{ SourceRepositoryRecord(it, _context) }

    /**
     * models
     */
    override val models: List<Module>
        = ModuleRecord.from(_record.getList("models", emptyList()), _context)

    /**
     * templates
     */
    override val templates: List<Module>
        = ModuleRecord.from(_record.getList("templates", emptyList()), _context)

    /**
     * schemas
     */
    override val schemas: List<Module>
        = ModuleRecord.from(_record.getList("schemas", emptyList()), _context)

    companion object {
        /**
         * creates record list from list of map
         */
        fun from(_context: Context): ProjectList {
            return _context.get("projects") as ProjectList
        }
        fun from(records: RecordList, _context: Context, parentProject: Project? = null) = records
            .mergeWithKeys("group", "name")
            .map {
                ProjectRecord(it, _context, parentProject = parentProject)
            }
    }
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is ProjectRecord) return false
        if (parentProject != other.parentProject) return false
        if (group != other.group) return false
        if (name != other.name) return false
        return true
    }

    override fun hashCode(): Int {
        var result = parentProject.hashCode()
        result = 31 * result + group.hashCode()
        result = 31 * result + name.hashCode()
        return result
    }

    override fun toString(): String {
        return "ProjectRecord(" +
            "parentProject=$parentProject, " +
            "group=$group, " +
            "name=$name" +
        ")"
    }
}