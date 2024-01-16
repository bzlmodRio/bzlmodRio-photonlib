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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.2.0/photonlib-cpp-v2024.2.0-headers.zip",
        sha256 = "d14ed5b89d31ea8eef2e9f557c0196943ae57ff1505b656280f2639f8632b4b5",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.2.0/photonlib-cpp-v2024.2.0-windowsx86-64.zip",
        sha256 = "c46027ca1b02e49bf816fd56db673d16508ea382de6cbcea1f673f2e7770d115",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.2.0/photonlib-cpp-v2024.2.0-linuxathena.zip",
        sha256 = "8b86818cac34ab5fe220d5358a540817847427de5fde4a310ab3f52382e9c3e5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.2.0/photonlib-cpp-v2024.2.0-linuxx86-64.zip",
        sha256 = "27237876292b9d0a7bc7d718707b8e0bb2a3b52439029bbe8335b1847a2bf641",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.2.0/photonlib-cpp-v2024.2.0-osxuniversal.zip",
        sha256 = "620c74eae4e869064a0cb075092b56ef1d2c2b561c9a2c795e5569c779b48a90",
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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.2.0/photontargeting-cpp-v2024.2.0-headers.zip",
        sha256 = "2a35c2eee9f341251cb08d33b67fadcdf7a1700fde147e35db9fdee4941b6fc0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.2.0/photontargeting-cpp-v2024.2.0-windowsx86-64.zip",
        sha256 = "04b59f209109482641911fa302b5b94117abf25d6a7a65fb38f73e66d6c6b13a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.2.0/photontargeting-cpp-v2024.2.0-linuxathena.zip",
        sha256 = "0450ecd14cb4f023dcf4468edb2211796b31e126634b88802d5ed82fe6d62685",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.2.0/photontargeting-cpp-v2024.2.0-linuxx86-64.zip",
        sha256 = "813ff24ac3088728689ed64b8fb7472daf648a781a9b345823ef0d66ac6145e0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.2.0/photontargeting-cpp-v2024.2.0-osxuniversal.zip",
        sha256 = "a0122d9e3fc522cfbe8d82cc21b0fb3d1235ddbc0b0bf1f8396929532d6e921b",
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
