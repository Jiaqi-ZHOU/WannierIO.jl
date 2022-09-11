
@testset "read/write eig" begin
    E = read_eig(joinpath(FIXTURE_PATH, "formatted/si2.eig"))

    tmpfile = tempname(; cleanup=true)
    write_eig(tmpfile, E)
    E2 = read_eig(tmpfile)

    @test E ≈ E2
end