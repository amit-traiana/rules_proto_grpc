load("//go:go_proto_compile.bzl", "go_proto_compile")
load("@io_bazel_rules_go//go:def.bzl", "go_library")

def go_proto_library(**kwargs):
    name = kwargs.get("name")
    deps = kwargs.get("deps")
    importpath = kwargs.get("importpath")
    visibility = kwargs.get("visibility")
    go_deps = kwargs.get("go_deps", [])

    name_pb = name + "_pb"

    go_proto_compile(
        name = name_pb,
        deps = deps,
        transitive = True,
        visibility = visibility,
    )

    go_library(
        name = name,
        srcs = [name_pb],
        deps = go_deps + [
            "@com_github_golang_protobuf//proto:go_default_library",
        ],
        importpath = importpath,
        visibility = visibility,
    )

