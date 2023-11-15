load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_photonlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_photonvision_photonlib_java",
        artifact = "org.photonvision:PhotonLib-java:v2024.1.1-beta-3.2",
        artifact_sha256 = "c82ba4eb4498003442538583db8b030185f2331f1d1d3d35b2e102253a8555a2",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )
    jvm_maven_import_external(
        name = "org_photonvision_photontargeting_java",
        artifact = "org.photonvision:PhotonTargeting-java:v2024.1.1-beta-3.2",
        artifact_sha256 = "334c03c0a34fdbdb074c1b12305928e63ce0a7e07aeb0670de05693a68a6b446",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )

def setup_legacy_bzlmodrio_photonlib_java_dependencies():
    __setup_bzlmodrio_photonlib_java_dependencies(None)

setup_bzlmodrio_photonlib_java_dependencies = module_extension(
    __setup_bzlmodrio_photonlib_java_dependencies,
)
