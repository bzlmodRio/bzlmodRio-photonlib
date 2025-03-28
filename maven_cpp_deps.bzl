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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2025.3.1/photonlib-cpp-v2025.3.1-headers.zip",
        sha256 = "647645dfa3122e9d739f07dd70bc1115ca8822a12431518be5850d6b8efab074",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2025.3.1/photonlib-cpp-v2025.3.1-windowsx86-64.zip",
        sha256 = "240b4b4ba9789aea77b4d44adc437056f721e7c82664223abcd3037d5ce12288",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2025.3.1/photonlib-cpp-v2025.3.1-linuxathena.zip",
        sha256 = "cf323311e1b4fc958038ba46f1f50a95a9c5d6ce80b6c6e99838d77a1a212264",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2025.3.1/photonlib-cpp-v2025.3.1-linuxx86-64.zip",
        sha256 = "750d67a5c9ee4f8cf0ff4047eb99e584b89b9189b1f6d63804feced31a41baa7",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2025.3.1/photonlib-cpp-v2025.3.1-osxuniversal.zip",
        sha256 = "3720b379dd8fe2078f1892e3aef996fd71a99679d125116cc2aa9650c8ea3eed",
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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2025.3.1/photontargeting-cpp-v2025.3.1-headers.zip",
        sha256 = "d96fac02a46aef30740333b094c1e881ce9cd9f2d2a5674291335bd67c5691ad",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2025.3.1/photontargeting-cpp-v2025.3.1-windowsx86-64.zip",
        sha256 = "e54309e6d5c378c6dc921e4b290597885480cef4720818fd1e39355f8d1eac97",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2025.3.1/photontargeting-cpp-v2025.3.1-linuxathena.zip",
        sha256 = "f00db7530e71b652955c2f7e35d1b59f452bf60dd336e951bcacdf006a5de357",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2025.3.1/photontargeting-cpp-v2025.3.1-linuxx86-64.zip",
        sha256 = "7d6ca7771282d49a68dd527451d653dd286c48923a57dc465059a9d54adfacaa",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2025.3.1/photontargeting-cpp-v2025.3.1-osxuniversal.zip",
        sha256 = "337feb8326105cbe5d52fd3ec231ec3090b886d74d568fe17684b64abfba3123",
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
