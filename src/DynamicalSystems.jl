"""
A Julia suite for chaos and nonlinear dynamics
"""
module DynamicalSystems

using Reexport

@reexport using DelayEmbeddings
@reexport using DynamicalSystemsBase
@reexport using Entropies
@reexport using ChaosTools
@reexport using RecurrenceAnalysis

# Also export some static array stuff
using DelayEmbeddings.StaticArrays
export SVector, SMatrix, @SVector, @SMatrix, Size

# Update messages:
using Scratch
display_update = true
version_number = "2.4.0"
update_name = "update_v$(version_number)"
update_message = """
\nUpdate message: DynamicalSystems v$(version_number)\n
- New functions that compute distances between datasets:
  `dataset_distance` and `datasets_sets_distances`.
- Clustering in `AttractorsViaFeaturizing` is now configured via
  a dedicated struct called `ClusteringConfig`.
"""

if display_update
    # Get scratch space for this package
    versions_dir = @get_scratch!("versions")
    if !isfile(joinpath(versions_dir, update_name))
        printstyled(
            stdout,
            update_message;
            color = :light_magenta,
        )
        touch(joinpath(versions_dir, update_name))
    end
end


end # module
