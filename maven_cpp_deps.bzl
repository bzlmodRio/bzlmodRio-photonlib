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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.2.3/photonlib-cpp-v2024.2.3-headers.zip",
        sha256 = "721b53d895c4cc5540eb728f8ced9f200e5ea20d15ade6a958fc74864154d14c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.2.3/photonlib-cpp-v2024.2.3-windowsx86-64.zip",
        sha256 = "dcbb097ce3fb59960f8ad9222cdb5b6e87f5e68bc537de1b62d3b96a309500ea",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.2.3/photonlib-cpp-v2024.2.3-linuxathena.zip",
        sha256 = "382f41224c709fd16321e2016fbbf43831dc4d4b5af166c231622707db857c14",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.2.3/photonlib-cpp-v2024.2.3-linuxx86-64.zip",
        sha256 = "31753001ee7fa28049a40516c608ad7a76a0e7a167c0033ca989113d4e7c9c26",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.2.3/photonlib-cpp-v2024.2.3-osxuniversal.zip",
        sha256 = "95fd9abe902dd1ac2962ece76cbcced4db29481e14e5f53e66af52142d2dbf3e",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libphotonlib.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libapriltag.dylib @rpath/libapriltag.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libphotontargeting.dylib @rpath/libphotontargeting.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libphotonlib.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_headers",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.2.3/photontargeting-cpp-v2024.2.3-headers.zip",
        sha256 = "c4937dce282ad1e42b11b1587ccb9a371b8a1627d96c9aed3103fc9b63db7eba",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.2.3/photontargeting-cpp-v2024.2.3-windowsx86-64.zip",
        sha256 = "54b34f31916e38db5366b5c3ff10889236f068a20fd35f1830aee8ed2dc4b311",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.2.3/photontargeting-cpp-v2024.2.3-linuxathena.zip",
        sha256 = "253fe6fa7a3a78c493b799cdb1e12e07b9c22e2d7c2387ac35be34dda302e7a7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.2.3/photontargeting-cpp-v2024.2.3-linuxx86-64.zip",
        sha256 = "5626dcd5f15e04bbdf433561d07618624d3c77298cc944ae0317ab870f9aa921",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.2.3/photontargeting-cpp-v2024.2.3-osxuniversal.zip",
        sha256 = "f44cd4b1c510614426d764f1cc6c0feb8d3df3ba8031f880d69d593577ecd2dd",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libphotontargeting.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libapriltag.dylib @rpath/libapriltag.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libphotontargeting.dylib",
        ],
    )

def setup_legacy_bzlmodrio_photonlib_cpp_dependencies():
    __setup_bzlmodrio_photonlib_cpp_dependencies(None)

setup_bzlmodrio_photonlib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_photonlib_cpp_dependencies,
)
