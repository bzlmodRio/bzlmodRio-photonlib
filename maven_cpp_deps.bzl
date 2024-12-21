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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2025.0.0-beta-8/photonlib-cpp-v2025.0.0-beta-8-headers.zip",
        sha256 = "ea89d2f54253b84c617fe20fd95ebd541087037d794ab07009f5aac57613f7e1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2025.0.0-beta-8/photonlib-cpp-v2025.0.0-beta-8-windowsx86-64.zip",
        sha256 = "177c0fd7469c75ddadcfe1b95afe826575e96321b0b7dca0c260de241531f61f",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2025.0.0-beta-8/photonlib-cpp-v2025.0.0-beta-8-linuxathena.zip",
        sha256 = "96f23e35ea5b18e6391353dd3d18f7fb9cd3f069350df9966708757b0f5e80ef",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2025.0.0-beta-8/photonlib-cpp-v2025.0.0-beta-8-linuxx86-64.zip",
        sha256 = "c81b0ba9cc0224494b89e4f67e0c66a703992fbf9661dd872cc97e356929eade",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2025.0.0-beta-8/photonlib-cpp-v2025.0.0-beta-8-osxuniversal.zip",
        sha256 = "447a1bff0947e6f694285548f4b7be058d564535cbdb76dba231a9cdf94cd2e1",
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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2025.0.0-beta-8/photontargeting-cpp-v2025.0.0-beta-8-headers.zip",
        sha256 = "7ef12d421b53692144c90461e8320678ce2dc5eed1aa6ffdfe7e64681e7fd1e4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2025.0.0-beta-8/photontargeting-cpp-v2025.0.0-beta-8-windowsx86-64.zip",
        sha256 = "e8b61ea6fec69b5112fc5325ea0548e6902a3d0f8210a9fbc323f637aa3327b8",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2025.0.0-beta-8/photontargeting-cpp-v2025.0.0-beta-8-linuxathena.zip",
        sha256 = "79dc1d8ec4a9c99a703b6d80d4906d34791006a6aec4eb48447a3bf1ebc3fada",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2025.0.0-beta-8/photontargeting-cpp-v2025.0.0-beta-8-linuxx86-64.zip",
        sha256 = "7c4567807b891629c4aa72a599f6158a9fc68f100da7a4516e38e7cf31d80116",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2025.0.0-beta-8/photontargeting-cpp-v2025.0.0-beta-8-osxuniversal.zip",
        sha256 = "ab3968336712708158d25930ec2051a6a9705dc66d27faaae34400f309662c2f",
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
