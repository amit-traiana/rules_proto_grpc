# Python rules

Rules for generating Python protobuf and gRPC `.py` files and libraries using standard Protocol Buffers and gRPC or [grpclib](https://github.com/vmagamedov/grpclib). Libraries are created with the Bazel native `py_library`

| Rule | Description |
| ---: | :--- |
| [python_proto_compile](#python_proto_compile) | Generates Python protobuf `.py` artifacts |
| [python_grpc_compile](#python_grpc_compile) | Generates Python protobuf+gRPC `.py` artifacts |
| [python_grpclib_compile](#python_grpclib_compile) | Generates Python protobuf+grpclib `.py` artifacts (supports Python 3 only) |
| [python_proto_library](#python_proto_library) | Generates a Python protobuf library using `py_library` |
| [python_grpc_library](#python_grpc_library) | Generates a Python protobuf+gRPC library using `py_library` |
| [python_grpclib_library](#python_grpclib_library) | Generates a Python protobuf+grpclib library using `py_library` (supports Python 3 only) |

---

## `python_proto_compile`

Generates Python protobuf `.py` artifacts

### `WORKSPACE`

```python
load("@rules_proto_grpc//python:repositories.bzl", rules_proto_grpc_python_repos="python_repos")

rules_proto_grpc_python_repos()
```

### `BUILD.bazel`

```python
load("@rules_proto_grpc//python:defs.bzl", "python_proto_compile")

python_proto_compile(
    name = "person_python_proto",
    deps = ["@rules_proto_grpc//example/proto:person_proto"],
)
```

### Attributes

| Name | Type | Mandatory | Default | Description |
| ---: | :--- | --------- | ------- | ----------- |
| `deps` | `list<ProtoInfo>` | true | `[]`    | List of labels that provide a `ProtoInfo` (such as `native.proto_library`)          |
| `verbose` | `int` | false | `0`    | The verbosity level. Supported values and results are 1: *show command*, 2: *show command and sandbox after running protoc*, 3: *show command and sandbox before and after running protoc*, 4. *show env, command, expected outputs and sandbox before and after running protoc*          |

---

## `python_grpc_compile`

Generates Python protobuf+gRPC `.py` artifacts

### `WORKSPACE`

```python
load("@rules_proto_grpc//python:repositories.bzl", rules_proto_grpc_python_repos="python_repos")

rules_proto_grpc_python_repos()

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()
```

### `BUILD.bazel`

```python
load("@rules_proto_grpc//python:defs.bzl", "python_grpc_compile")

python_grpc_compile(
    name = "greeter_python_grpc",
    deps = ["@rules_proto_grpc//example/proto:greeter_grpc"],
)
```

### Attributes

| Name | Type | Mandatory | Default | Description |
| ---: | :--- | --------- | ------- | ----------- |
| `deps` | `list<ProtoInfo>` | true | `[]`    | List of labels that provide a `ProtoInfo` (such as `native.proto_library`)          |
| `verbose` | `int` | false | `0`    | The verbosity level. Supported values and results are 1: *show command*, 2: *show command and sandbox after running protoc*, 3: *show command and sandbox before and after running protoc*, 4. *show env, command, expected outputs and sandbox before and after running protoc*          |

---

## `python_grpclib_compile`

Generates Python protobuf+grpclib `.py` artifacts (supports Python 3 only)

### `WORKSPACE`

```python
load("@rules_proto_grpc//python:repositories.bzl", rules_proto_grpc_python_repos="python_repos")

rules_proto_grpc_python_repos()

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@rules_python//python:repositories.bzl", "py_repositories")
py_repositories()

load("@rules_python//python:pip.bzl", "pip_repositories")
pip_repositories()

load("@rules_python//python:pip.bzl", "pip_import")
pip_import(
    name = "rules_proto_grpc_py2_deps",
    python_interpreter = "python", # Replace this with the platform specific Python 2 name, or remove if not using Python 2
    requirements = "@rules_proto_grpc//python:requirements.txt",
)

load("@rules_proto_grpc_py2_deps//:requirements.bzl", pip2_install="pip_install")
pip2_install()

pip_import(
    name = "rules_proto_grpc_py3_deps",
    python_interpreter = "python3",
    requirements = "@rules_proto_grpc//python:requirements.txt",
)

load("@rules_proto_grpc_py3_deps//:requirements.bzl", pip3_install="pip_install")
pip3_install()
```

### `BUILD.bazel`

```python
load("@rules_proto_grpc//python:defs.bzl", "python_grpclib_compile")

python_grpclib_compile(
    name = "greeter_python_grpc",
    deps = ["@rules_proto_grpc//example/proto:greeter_grpc"],
)
```

### Attributes

| Name | Type | Mandatory | Default | Description |
| ---: | :--- | --------- | ------- | ----------- |
| `deps` | `list<ProtoInfo>` | true | `[]`    | List of labels that provide a `ProtoInfo` (such as `native.proto_library`)          |
| `verbose` | `int` | false | `0`    | The verbosity level. Supported values and results are 1: *show command*, 2: *show command and sandbox after running protoc*, 3: *show command and sandbox before and after running protoc*, 4. *show env, command, expected outputs and sandbox before and after running protoc*          |

---

## `python_proto_library`

Generates a Python protobuf library using `py_library`

### `WORKSPACE`

```python
load("@rules_proto_grpc//python:repositories.bzl", rules_proto_grpc_python_repos="python_repos")

rules_proto_grpc_python_repos()
```

### `BUILD.bazel`

```python
load("@rules_proto_grpc//python:defs.bzl", "python_proto_library")

python_proto_library(
    name = "person_python_library",
    deps = ["@rules_proto_grpc//example/proto:person_proto"],
)
```

### Attributes

| Name | Type | Mandatory | Default | Description |
| ---: | :--- | --------- | ------- | ----------- |
| `deps` | `list<ProtoInfo>` | true | `[]`    | List of labels that provide a `ProtoInfo` (such as `native.proto_library`)          |
| `verbose` | `int` | false | `0`    | The verbosity level. Supported values and results are 1: *show command*, 2: *show command and sandbox after running protoc*, 3: *show command and sandbox before and after running protoc*, 4. *show env, command, expected outputs and sandbox before and after running protoc*          |

---

## `python_grpc_library`

Generates a Python protobuf+gRPC library using `py_library`

### `WORKSPACE`

```python
load("@rules_proto_grpc//python:repositories.bzl", rules_proto_grpc_python_repos="python_repos")

rules_proto_grpc_python_repos()

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@rules_python//python:repositories.bzl", "py_repositories")
py_repositories()

load("@rules_python//python:pip.bzl", "pip_repositories")
pip_repositories()

load("@rules_python//python:pip.bzl", "pip_import")
pip_import(
    name = "rules_proto_grpc_py2_deps",
    python_interpreter = "python", # Replace this with the platform specific Python 2 name, or remove if not using Python 2
    requirements = "@rules_proto_grpc//python:requirements.txt",
)

load("@rules_proto_grpc_py2_deps//:requirements.bzl", pip2_install="pip_install")
pip2_install()

pip_import(
    name = "rules_proto_grpc_py3_deps",
    python_interpreter = "python3",
    requirements = "@rules_proto_grpc//python:requirements.txt",
)

load("@rules_proto_grpc_py3_deps//:requirements.bzl", pip3_install="pip_install")
pip3_install()
```

### `BUILD.bazel`

```python
load("@rules_proto_grpc//python:defs.bzl", "python_grpc_library")

python_grpc_library(
    name = "greeter_python_library",
    deps = ["@rules_proto_grpc//example/proto:greeter_grpc"],
)
```

### Attributes

| Name | Type | Mandatory | Default | Description |
| ---: | :--- | --------- | ------- | ----------- |
| `deps` | `list<ProtoInfo>` | true | `[]`    | List of labels that provide a `ProtoInfo` (such as `native.proto_library`)          |
| `verbose` | `int` | false | `0`    | The verbosity level. Supported values and results are 1: *show command*, 2: *show command and sandbox after running protoc*, 3: *show command and sandbox before and after running protoc*, 4. *show env, command, expected outputs and sandbox before and after running protoc*          |
| `python_version` | `string` | false | `PY3`    | Specify the Python version to use for the bundled dependencies. Valid values are "PY3" (the default) and "PY2"          |

---

## `python_grpclib_library`

Generates a Python protobuf+grpclib library using `py_library` (supports Python 3 only)

### `WORKSPACE`

```python
load("@rules_proto_grpc//python:repositories.bzl", rules_proto_grpc_python_repos="python_repos")

rules_proto_grpc_python_repos()

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@rules_python//python:repositories.bzl", "py_repositories")
py_repositories()

load("@rules_python//python:pip.bzl", "pip_repositories")
pip_repositories()

load("@rules_python//python:pip.bzl", "pip_import")
pip_import(
    name = "rules_proto_grpc_py2_deps",
    python_interpreter = "python", # Replace this with the platform specific Python 2 name, or remove if not using Python 2
    requirements = "@rules_proto_grpc//python:requirements.txt",
)

load("@rules_proto_grpc_py2_deps//:requirements.bzl", pip2_install="pip_install")
pip2_install()

pip_import(
    name = "rules_proto_grpc_py3_deps",
    python_interpreter = "python3",
    requirements = "@rules_proto_grpc//python:requirements.txt",
)

load("@rules_proto_grpc_py3_deps//:requirements.bzl", pip3_install="pip_install")
pip3_install()
```

### `BUILD.bazel`

```python
load("@rules_proto_grpc//python:defs.bzl", "python_grpclib_library")

python_grpclib_library(
    name = "greeter_python_library",
    deps = ["@rules_proto_grpc//example/proto:greeter_grpc"],
)
```

### Attributes

| Name | Type | Mandatory | Default | Description |
| ---: | :--- | --------- | ------- | ----------- |
| `deps` | `list<ProtoInfo>` | true | `[]`    | List of labels that provide a `ProtoInfo` (such as `native.proto_library`)          |
| `verbose` | `int` | false | `0`    | The verbosity level. Supported values and results are 1: *show command*, 2: *show command and sandbox after running protoc*, 3: *show command and sandbox before and after running protoc*, 4. *show env, command, expected outputs and sandbox before and after running protoc*          |
