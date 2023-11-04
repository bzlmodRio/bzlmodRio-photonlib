load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_photonlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_photonvision_photonlib_java",
        artifact = "org.photonvision:PhotonLib-java:v2024.1.1-beta-3",
        artifact_sha256 = "c835cd19165852a50b713847cd9d8b8578bfade6d9ead0b32c333a1c00092e18",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )
    jvm_maven_import_external(
        name = "org_photonvision_photontargeting_java",
        artifact = "org.photonvision:PhotonTargeting-java:v2024.1.1-beta-3",
        artifact_sha256 = "61f66c9fd4004eeb4c36687fd0ae80a616c0d73ccc0b0fa253f0e37d46899c3f",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )

def setup_legacy_bzlmodrio_photonlib_java_dependencies():
    __setup_bzlmodrio_photonlib_java_dependencies(None)

setup_bzlmodrio_photonlib_java_dependencies = module_extension(
    __setup_bzlmodrio_photonlib_java_dependencies,
)
