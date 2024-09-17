load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "header_files",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

def __setup_bzlmodrio_photonlib_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_headers",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.3.1/photonlib-cpp-v2024.3.1-headers.zip",
        sha256 = "23c1e0ccd6cc0a426d512b2b04b429b56336955a9da2adc0520666bfeffe8ba9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.3.1/photonlib-cpp-v2024.3.1-windowsx86-64.zip",
        sha256 = "4621a0b5ff22df890c60be56d39c466d5f75488a1695d7bc13b1426c938f9c20",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.3.1/photonlib-cpp-v2024.3.1-linuxathena.zip",
        sha256 = "6b357ee66479c4ac8e144c7bc65ac1f5aa71ecf90be989937d5f09724c4a4140",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.3.1/photonlib-cpp-v2024.3.1-linuxx86-64.zip",
        sha256 = "fde979b6055ac5b12e1a67409a40cb006681a5c8a24c2707c2eb9ef3e8eeaa30",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2024.3.1/photonlib-cpp-v2024.3.1-osxuniversal.zip",
        sha256 = "67f1c4d33f2498343450e205c3b362841459895710d0edd94f5aa63da65aabad",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.3.1/photontargeting-cpp-v2024.3.1-headers.zip",
        sha256 = "407982b027ebf544686614aa5db14edefeae450ea540f7c65e62994023c9ab8e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.3.1/photontargeting-cpp-v2024.3.1-windowsx86-64.zip",
        sha256 = "d0df9a4fa59f9609dc15dca0fa578ec400d7b224cd66807f0137dab2ef8f10a4",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.3.1/photontargeting-cpp-v2024.3.1-linuxathena.zip",
        sha256 = "1a7bfc2bc4ce3232ccffb397af33af1b607177b912d28cc0c08ef9d717c4b92b",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.3.1/photontargeting-cpp-v2024.3.1-linuxx86-64.zip",
        sha256 = "dce5ce9939b0b2df741bdfb7fffd543ef7ee06981dc7e1d9c623e37029ced792",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2024.3.1/photontargeting-cpp-v2024.3.1-osxuniversal.zip",
        sha256 = "86e81b5046e7ba40ccb63702d9d7d4fde9cb9f1411588a225df1ffd8a2fbf989",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
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
