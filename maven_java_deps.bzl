load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_photonlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_photonvision_photonlib_java",
        artifact = "org.photonvision:photonlib-java:v2026.1.1-rc-3",
        artifact_sha256 = "dddac0cf9fc834ae109925644901f30ea72667db4d63a043f847a73972b49ff5",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )
    jvm_maven_import_external(
        name = "org_photonvision_photontargeting_java",
        artifact = "org.photonvision:photontargeting-java:v2026.1.1-rc-3",
        artifact_sha256 = "8b9874f098d60f043b1d70d5af07791e85fa53a2ea32198f50f76bf73668e8be",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )

def setup_legacy_bzlmodrio_photonlib_java_dependencies():
    __setup_bzlmodrio_photonlib_java_dependencies(None)

setup_bzlmodrio_photonlib_java_dependencies = module_extension(
    __setup_bzlmodrio_photonlib_java_dependencies,
)
