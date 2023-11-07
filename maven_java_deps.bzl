load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_photonlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_photonvision_photonlib_java",
        artifact = "org.photonvision:PhotonLib-java:v2024.1.1-beta-3.1",
        artifact_sha256 = "e88febfe9723436fc309db72affc82b34a70203539aee27552c3f16e788e00c6",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )
    jvm_maven_import_external(
        name = "org_photonvision_photontargeting_java",
        artifact = "org.photonvision:PhotonTargeting-java:v2024.1.1-beta-3.1",
        artifact_sha256 = "e5d1d41f7b647ffacfcc7efc72b7d2edb356fd3550e03dc16dba103639207617",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )

def setup_legacy_bzlmodrio_photonlib_java_dependencies():
    __setup_bzlmodrio_photonlib_java_dependencies(None)

setup_bzlmodrio_photonlib_java_dependencies = module_extension(
    __setup_bzlmodrio_photonlib_java_dependencies,
)
