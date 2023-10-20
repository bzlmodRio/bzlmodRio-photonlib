import os

from bazelrio_gentool.load_vendordep_dependency import vendordep_dependency
from get_allwpilib_dependencies import get_allwpilib_dependencies
from bazelrio_gentool.deps.dependency_container import (
    ModuleDependency,
)


def get_photonlib_dependencies(
    use_local_allwpilib=False,
    use_local_opencv=False,
    use_local_ni=True,
    allwpilib_version_override="2023.3.2",
    opencv_version_override="4.6.0-4",
    ni_version_override="2023.3.0",
):
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    group = vendordep_dependency(
        "bzlmodrio-photonlib",
        os.path.join(SCRIPT_DIR, f"vendor_dep.json"),
        year=2023,
        fail_on_hash_miss=False,
        has_static_libraries=False,
    )

    allwpilib_dependency = ModuleDependency(
        get_allwpilib_dependencies(
            use_local_opencv=use_local_opencv,
            use_local_ni=use_local_ni,
            opencv_version_override=opencv_version_override,
            ni_version_override=ni_version_override,
        ),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-allwpilib",
        remote_repo="bzlmodRio-allwpilib",
        override_version=allwpilib_version_override,
    )
    group.add_module_dependency(allwpilib_dependency)

    group.add_cc_meta_dependency(
        "photonlib-cpp",
        deps=[
            "PhotonLib-cpp",
            "apriltag-cpp",
            "wpilibc-cpp",
        ],
        platform_deps={},
        jni_deps={
            # TODO
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
            "photontargeting-java",
        ],
    )

    return group
