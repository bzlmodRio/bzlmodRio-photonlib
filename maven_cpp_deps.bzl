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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/PhotonLib-cpp/v2024.1.1-beta-3.1/PhotonLib-cpp-v2024.1.1-beta-3.1-headers.zip",
        sha256 = "c28f77fe4a8a5ec7a4cea6596dd425033b3c4d86deeb2da429acd4743332b4e7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/PhotonLib-cpp/v2024.1.1-beta-3.1/PhotonLib-cpp-v2024.1.1-beta-3.1-windowsx86-64.zip",
        sha256 = "d7788e261f53557469c130128594773a9d01df9e84238ef9f08c5cf5da096bec",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/PhotonLib-cpp/v2024.1.1-beta-3.1/PhotonLib-cpp-v2024.1.1-beta-3.1-linuxathena.zip",
        sha256 = "8df0d0680503a8228f5b34bbb523f4401bf669b9a72a96a4f51bc89e91fa5932",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/PhotonLib-cpp/v2024.1.1-beta-3.1/PhotonLib-cpp-v2024.1.1-beta-3.1-linuxx86-64.zip",
        sha256 = "4f96e2dcf41ffd0aaacf46cab16d7faec22e7ded7e655b5ec6dab1c7f0365366",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/PhotonLib-cpp/v2024.1.1-beta-3.1/PhotonLib-cpp-v2024.1.1-beta-3.1-osxuniversal.zip",
        sha256 = "197c2cdcdfb9b684b00a11bb8b9de39e4a6c4b0f4e3ecbd90b2c2987fa74251c",
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
