@testitem "read hr ws" begin
    using LazyArtifacts
    hrdat = read_w90_hrdat(artifact"Si2_valence/reference/ws/Si2_valence_hr.dat")
    # just some simple tests
    @test length(hrdat.Rvectors) == 279
    @test hrdat.Rvectors[1] == [-4, 0, 2]
    @test length(hrdat.H) == 279
    H1 = ComplexF64[
        0.000805+0.0im -0.000431-0.0im -0.000137+0.0im -0.000431+0.0im
        -0.000431-0.0im 0.000805+0.0im -0.000137+0.0im -0.000431-0.0im
        -0.000299+0.0im -0.000298+0.0im 0.000534+0.0im -0.000298-0.0im
        -0.000431+0.0im -0.000431+0.0im -0.000137-0.0im 0.000805-0.0im
    ]
    @test hrdat.H[1] ≈ H1
end

@testitem "read hr mdrs" begin
    using LazyArtifacts
    # The two files are identical
    hrdat = read_w90_hrdat(artifact"Si2_valence/reference/ws/Si2_valence_hr.dat")
    hrdat_ws = read_w90_hrdat(artifact"Si2_valence/reference/ws/Si2_valence_hr.dat")

    for p in propertynames(hrdat)
        p == :header && continue
        @test hrdat_ws[p] ≈ hrdat[p]
    end
end
