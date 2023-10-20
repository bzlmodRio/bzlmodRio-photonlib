from get_photonlib_dependencies import get_photonlib_dependencies


def main():
    group = get_photonlib_dependencies()
    print(group.version)


if __name__ == "__main__":
    main()
