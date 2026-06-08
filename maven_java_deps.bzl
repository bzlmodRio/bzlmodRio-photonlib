load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_photonlib_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "org_photonvision_photonlib_java",
        artifact = "org.photonvision:photonlib-java:v2027.0.0-alpha-2",
        artifact_sha256 = "b3fb3a5f5e1f8be18044a4ed2edecef7db666d906441f42e799ed0a0a0242906",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )
    jvm_maven_import_external(
        name = "org_photonvision_photontargeting_java",
        artifact = "org.photonvision:photontargeting-java:v2027.0.0-alpha-2",
        artifact_sha256 = "1c33f518108efcceda47de5db9591d9bf3ec66d77d4c27d07a5a344cad31151b",
        server_urls = ["https://maven.photonvision.org/repository/internal"],
    )

setup_bzlmodrio_photonlib_java_dependencies = module_extension(
    __setup_bzlmodrio_photonlib_java_dependencies,
)
