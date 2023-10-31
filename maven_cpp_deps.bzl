load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_photonlib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_headers",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/PhotonLib-cpp/v2024.1.1-beta-1/PhotonLib-cpp-v2024.1.1-beta-1-headers.zip",
        sha256 = "6f1879ceb5ede30fa6ca72dbd464c4a2275a19bf2986594b36dc8265418dea11",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/PhotonLib-cpp/v2024.1.1-beta-1/PhotonLib-cpp-v2024.1.1-beta-1-windowsx86-64.zip",
        sha256 = "93833c257c8c90add1d129f1350984bc79836a7d558d2d98dd5694f76c45d140",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/PhotonLib-cpp/v2024.1.1-beta-1/PhotonLib-cpp-v2024.1.1-beta-1-linuxathena.zip",
        sha256 = "22160a325ba2ec2f2db0617732905f4e5216628579f4d572d86feaf9b6e57155",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/PhotonLib-cpp/v2024.1.1-beta-1/PhotonLib-cpp-v2024.1.1-beta-1-linuxx86-64.zip",
        sha256 = "4e3e24d198404dba0680caf85960675ed026575d57cb01f60f39111024e202f6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/PhotonLib-cpp/v2024.1.1-beta-1/PhotonLib-cpp-v2024.1.1-beta-1-osxuniversal.zip",
        sha256 = "678660be9cb022d1d0f0f23d3b261d9c4b88f4164f723a5e32f828dd8a9d8682",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libPhoton.dylib osx/universal/shared/libPhoton.dylib",
            "install_name_tool -change libapriltag.dylib @rpath/libapriltag.dylib osx/universal/shared/libPhoton.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libPhoton.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libPhoton.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libPhoton.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libPhoton.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libPhoton.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libPhoton.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libPhoton.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libPhoton.dylib",
        ],
    )

def setup_legacy_bzlmodrio_photonlib_cpp_dependencies():
    __setup_bzlmodrio_photonlib_cpp_dependencies(None)

setup_bzlmodrio_photonlib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_photonlib_cpp_dependencies,
)
