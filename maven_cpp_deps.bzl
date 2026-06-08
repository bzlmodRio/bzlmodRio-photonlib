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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2027.0.0-alpha-2/photonlib-cpp-v2027.0.0-alpha-2-headers.zip",
        sha256 = "3f7e2f12d4e1d232cf81cf05fcb8c0cdc11ff4a12923b45c6094c7bb76d97e34",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2027.0.0-alpha-2/photonlib-cpp-v2027.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "888e946e113035604fca433c198f2de621fabe02319a25a743b3adf845dd717d",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxsystemcore",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2027.0.0-alpha-2/photonlib-cpp-v2027.0.0-alpha-2-linuxsystemcore.zip",
        sha256 = "ff573ef8c3b2387787255b5f7795ef79d06534d7165ec92a3dd27fd33cbca7ce",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2027.0.0-alpha-2/photonlib-cpp-v2027.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "ef2077668eb6c2139fe041fe7ed82ffd87547acd670477ac8f5269eabfed56ea",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photonlib-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-cpp/v2027.0.0-alpha-2/photonlib-cpp-v2027.0.0-alpha-2-osxuniversal.zip",
        sha256 = "9e68efa0a54240516d56f286c3801f49a9bf3e96d34d8e63aee944cc6a8b83a6",
        build_file = "@bzlmodrio-photonlib//private/cpp/photonlib-cpp:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libphotonlib.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libapriltag.dylib @rpath/libapriltag.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libphotonlib.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libphotonlib.dylib",
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
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2027.0.0-alpha-2/photontargeting-cpp-v2027.0.0-alpha-2-headers.zip",
        sha256 = "2ddf9904bd43d1c9354c1b6107559911423c5fb98e0026d2a3f1eb3a1bce22fb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_windowsx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2027.0.0-alpha-2/photontargeting-cpp-v2027.0.0-alpha-2-windowsx86-64.zip",
        sha256 = "12408ccf2ac78aa79a07ffe880ebb665c39880767ed7b944104afda29cff13fe",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxsystemcore",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2027.0.0-alpha-2/photontargeting-cpp-v2027.0.0-alpha-2-linuxsystemcore.zip",
        sha256 = "f0829ad12fd0c7500997e15e847980f4e2f4c24e54c025369127d58e36c57671",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_linuxx86-64",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2027.0.0-alpha-2/photontargeting-cpp-v2027.0.0-alpha-2-linuxx86-64.zip",
        sha256 = "43909779612698b27995516a09e743059201fcd9733ed9314dde28957693a696",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_org_photonvision_photontargeting-cpp_osxuniversal",
        url = "https://maven.photonvision.org/repository/internal/org/photonvision/photontargeting-cpp/v2027.0.0-alpha-2/photontargeting-cpp-v2027.0.0-alpha-2-osxuniversal.zip",
        sha256 = "5b47aefb7469be9613f01765c495e03624abfff6d5ae5a2e169c5bc945e98f33",
        build_file = "@bzlmodrio-photonlib//private/cpp/photontargeting-cpp:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libphotontargeting.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libapriltag.dylib @rpath/libapriltag.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libphotontargeting.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libphotontargeting.dylib",
        ],
    )

setup_bzlmodrio_photonlib_cpp_dependencies = module_extension(
    __setup_bzlmodrio_photonlib_cpp_dependencies,
)
