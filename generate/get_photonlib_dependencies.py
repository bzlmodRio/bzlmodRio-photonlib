import os

from bazelrio_gentool.deps.dependency_container import ModuleDependency
from bazelrio_gentool.load_vendordep_dependency import vendordep_dependency
from get_allwpilib_dependencies import get_allwpilib_dependencies


def get_photonlib_dependencies(
    use_local_allwpilib=False,
    use_local_opencv=False,
    allwpilib_version_override="2027.0.0-alpha-6",
    opencv_version_override="2027.4.13.0-3",
):
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

    allwpilib_dependency = ModuleDependency(
        get_allwpilib_dependencies(
            use_local_opencv=use_local_opencv,
            opencv_version_override=opencv_version_override,
        ),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-allwpilib",
        remote_repo="bzlmodRio-allwpilib",
        override_version=allwpilib_version_override,
    )

    group = vendordep_dependency(
        "bzlmodrio-photonlib",
        os.path.join(SCRIPT_DIR, f"vendor_dep.json"),
        fail_on_hash_miss=False,
        has_static_libraries=False,
        install_name_lookup={
            "photonlib-cpp": dict(
                artifact_install_name="photonlib",
                deps=[
                    "photontargeting-cpp",
                    allwpilib_dependency.container.get_cc_dependency("wpilibc-cpp"),
                    allwpilib_dependency.container.get_cc_dependency("apriltag-cpp"),
                    allwpilib_dependency.container.get_cc_dependency("cscore-cpp"),
                ],
            ),
            "photontargeting-cpp": dict(
                artifact_install_name="photontargeting",
                deps=[
                    allwpilib_dependency.container.get_cc_dependency("wpilibc-cpp"),
                    allwpilib_dependency.container.get_cc_dependency("apriltag-cpp"),
                    allwpilib_dependency.container.get_cc_dependency("cscore-cpp"),
                    allwpilib_dependency.container.get_cc_dependency(
                        "cameraserver-cpp"
                    ),
                ],
            ),
        },
    )
    group.add_module_dependency(allwpilib_dependency)

    group.add_cc_meta_dependency(
        "photontargeting-cpp",
        deps=[
            "photontargeting-cpp",
            "wpilibc-cpp",
            "apriltag-cpp",
            "cscore-cpp",
        ],
        platform_deps={},
        jni_deps={
            # TODO
        },
    )

    group.add_cc_meta_dependency(
        "photonlib-cpp",
        deps=[
            "photontargeting-cpp",
            "photonlib-cpp",
            "apriltag-cpp",
            "wpilibc-cpp",
            "cscore-cpp",
            "cameraserver-cpp",
        ],
        platform_deps={},
        jni_deps={
            "//conditions:default": [
                "photontargeting-cpp",
            ]
        },
    )

    group.add_java_meta_dependency(
        "photontargeting-java",
        group_id=f"org.photonvision",
        deps=[
            "wpilibj-java",
        ],
    )

    group.add_java_meta_dependency(
        "photonlib-java",
        group_id=f"org.photonvision",
        deps=[
            "wpilibj-java",
            "ntcore-java",
            "apriltag-java",
            "photontargeting-java",
            "photonlib-cpp",
        ],
    )

    return group
