load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_photonlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_photonvision_photonlib_java",
        artifact = "org.photonvision:PhotonLib-java:v2024.1.1-beta-1",
        artifact_sha256 = "001ae4485e3ad2c4a11543e4eb65ee1d3a2a3d25e37cef420506cbbef1dc50ec",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )
    jvm_maven_import_external(
        name = "org_photonvision_photontargeting_java",
        artifact = "org.photonvision:PhotonTargeting-java:v2024.1.1-beta-1",
        artifact_sha256 = "9c731436a1e1b0e288686cf65a5cd62eccb803f28b385336b096e100dae436d0",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )

def setup_legacy_bzlmodrio_photonlib_java_dependencies():
    __setup_bzlmodrio_photonlib_java_dependencies(None)

setup_bzlmodrio_photonlib_java_dependencies = module_extension(
    __setup_bzlmodrio_photonlib_java_dependencies,
)
