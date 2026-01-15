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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2026.1.1-rc-2/photonlib-cpp-v2026.1.1-rc-2-headers.zip",
        sha256 = "e1f1087b85ee4f4f0fdbec8218163f07aa4fb10785379269febbc656775d7d7f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2026.1.1-rc-2/photonlib-cpp-v2026.1.1-rc-2-windowsx86-64.zip",
        sha256 = "887852ecfe60ccd78ba057465f4ce34b28bac764c1ac59ffc9a66106698e8831",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2026.1.1-rc-2/photonlib-cpp-v2026.1.1-rc-2-linuxathena.zip",
        sha256 = "c899ab4f0809ec981b05e9e9577500e20d3ebea984321bb6db5f3847e6b7131b",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2026.1.1-rc-2/photonlib-cpp-v2026.1.1-rc-2-linuxx86-64.zip",
        sha256 = "a4e4a3b4790b19da149b0d1de09eedd755c2cc64cc9375603b80c6ac1ba74898",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2026.1.1-rc-2/photonlib-cpp-v2026.1.1-rc-2-osxuniversal.zip",
        sha256 = "e02921fca82a6642a98f30c6075cff7ccaba1beda8917f4b903cb246be1ea263",
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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2026.1.1-rc-2/photontargeting-cpp-v2026.1.1-rc-2-headers.zip",
        sha256 = "8fdbfbfb6247cb9f870e20ab2d14be2601e4013a7db17a7509eb9c2740c08ee2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2026.1.1-rc-2/photontargeting-cpp-v2026.1.1-rc-2-windowsx86-64.zip",
        sha256 = "7a041dd69de3e821345e9622d1144679d6748b70ed586498579219533784b156",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxathena",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2026.1.1-rc-2/photontargeting-cpp-v2026.1.1-rc-2-linuxathena.zip",
        sha256 = "43276312a301b8f38bdc835adbf4c6a074f637acf0d355084a8cd782dfb84016",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2026.1.1-rc-2/photontargeting-cpp-v2026.1.1-rc-2-linuxx86-64.zip",
        sha256 = "793b8389e517ad9570e869db2cf3b6ad6dd1513a8f84bbd431eb7828527e10f9",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2026.1.1-rc-2/photontargeting-cpp-v2026.1.1-rc-2-osxuniversal.zip",
        sha256 = "dc38878532c1713863bbadc112542e8158ebc3546be1fcb2dee3b05c54572542",
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
